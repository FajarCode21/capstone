import db from "../db/index.js";
export const insertBeasiswa = async (id_siswa, keterangan, nominal) => {
    const result = await db.query(
        `
        insert into beasiswa (id_siswa, keterangan, nominal) values ($1, $2, $3) returning *
        `,
        [id_siswa, keterangan, nominal]
    );

    return result.rows[0];
};

export const getAllBeasiswaUsers = async (input, filter, offset, limit) => {
    const result = await db.query(
        `
        select b.id_beasiswa,s.id_siswa, s.nisn, s.nama_lengkap, s.kelas, b.keterangan, b.nominal, count(*) over () as total
        from siswa s
        join beasiswa b using (id_siswa)
        where
        ($1 = '' or s.nisn ilike  $1 || '%' or s.nama_lengkap ilike '%' || $1 || '%' or s.kelas ilike '%' || $1 || '%') AND
        ($2 = '' or b.keterangan ilike '%' || $2 || '%')
        limit ${limit} offset ${offset}
        `,
        [input, filter]
    );

    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};

export const updateBeasiswa = async (id_beasiswa, nominal, keterangan) => {
    const result = await db.query(
        `
        update beasiswa set nominal = $2, keterangan = $3
        where id_beasiswa = $1 returning *;
        `,
        [id_beasiswa, nominal, keterangan]
    );

    return result.rows[0];
};

export const deleteBeasiswa = async (id_beasiswa) => {
    const result = await db.query(
        `
        delete from beasiswa where id_beasiswa = $1 returning *;
        `,
        [id_beasiswa]
    );

    return result.rowCount > 0;
};

export const searchSiswa = async (input) => {
    const result = await db.query(
        `
        select id_siswa, nisn, nama_lengkap, kelas from siswa
        where
        ($1 = '' or nisn ilike  $1 || '%' or nama_lengkap ilike '%' || $1 || '%' or kelas ilike '%' || $1 || '%')
        limit 10
        `,
        [input]
    );

    return result.rows;
};

export const getBiayaSemester = async (id_siswa) => {
    const result = await db.query(
        `
        SELECT 
        s.id_spp,
        s.semester,
        SUM(sd.nominal) AS total_biaya
        FROM spp s
        JOIN spp_details sd ON sd.id_spp = s.id_spp
        WHERE s.id_siswa = $1
        GROUP BY s.id_spp, s.semester
        ORDER BY s.semester;

        `,
        [id_siswa]
    );

    return result.rows;
};

export const getTotalPembayaran = async (id_siswa) => {
    const result = await db.query(
        `
        SELECT 
        s.id_spp,
        s.semester,
        COALESCE(SUM(p.nominal), 0) AS total_pembayaran
        FROM spp s
        LEFT JOIN spp_payments p ON p.id_spp = s.id_spp
        WHERE s.id_siswa = $1
        GROUP BY s.id_spp, s.semester
        ORDER BY s.semester;
        `,
        [id_siswa]
    );

    return result.rows;
};

export const insertSPPBeasiswa = async (
    id_spp,
    nominal,
    keterangan,
    id_beasiswa
) => {
    const result = await db.query(
        `
        insert into spp_payments (id_spp, nominal, keterangan, id_beasiswa) values ($1, $2, $3, $4) returning *;
        `,
        [id_spp, nominal, keterangan, id_beasiswa]
    );

    return result.rows[0];
};

export const insertTabunganBeasiswa = async (
    id_beasiswa,
    id_siswa,
    nominal
) => {
    const result = await db.query(
        `
        insert into tabungan_beasiswa (id_beasiswa, id_siswa, nominal) values ($1, $2, $3) returning *;
        `,
        [id_beasiswa, id_siswa, nominal]
    );

    return result.rows[0];
};

export const cekID = async (id_beasiswa, id_siswa) => {
    const result = await db.query(
        `
        select * from beasiswa
        where id_beasiswa = $1 and id_siswa = $2;
        `,
        [id_beasiswa, id_siswa]
    );

    return result.rows;
};

export const bayarSppDariBeasiswa = async (
    id_siswa,
    id_beasiswa,
    totalBeasiswa
) => {
    const biayaSemester = await getBiayaSemester(id_siswa);
    const totalPembayaran = await getTotalPembayaran(id_siswa);

    let sisaBeasiswa = parseInt(totalBeasiswa || 0);

    for (const biaya of biayaSemester) {
        const bayar = totalPembayaran.find((p) => p.id_spp === biaya.id_spp);
        const totalBayar = parseInt(bayar?.total_pembayaran || 0);
        const totalTagihan = parseInt(biaya.total_biaya || 0);

        const tunggakan = totalTagihan - totalBayar;

        if (tunggakan > 0 && sisaBeasiswa > 0) {
            const dibayar = Math.min(tunggakan, sisaBeasiswa);

            await insertSPPBeasiswa(
                biaya.id_spp,
                dibayar,
                "Pembayaran dari Beasiswa",
                id_beasiswa
            );

            sisaBeasiswa -= dibayar;

            if (sisaBeasiswa <= 0) break;
        }
    }

    if (sisaBeasiswa > 0) {
        await insertTabunganBeasiswa(id_beasiswa, id_siswa, sisaBeasiswa);
    }

    return true;
};

export const getBeasiswaAktifBySiswa = async (id_siswa) => {
    const result = await db.query(
        `
        SELECT * FROM beasiswa
        WHERE id_siswa = $1
        ORDER BY tanggal ASC;
        `,
        [id_siswa]
    );
    return result.rows;
};

export const alokasiUlangSemuaBeasiswa = async (id_siswa) => {
    const semuaBeasiswa = await getBeasiswaAktifBySiswa(id_siswa);

    if (semuaBeasiswa.length === 0) return;

    const beasiswaIds = semuaBeasiswa.map((b) => b.id_beasiswa);

    // Hapus spp_payments
    await db.query(
        `DELETE FROM spp_payments WHERE id_beasiswa = ANY($1::int[])`,
        [beasiswaIds]
    );

    // Hapus tabungan_beasiswa
    await db.query(
        `DELETE FROM tabungan_beasiswa WHERE id_beasiswa = ANY($1::int[])`,
        [beasiswaIds]
    );

    // Alokasikan ulang semua beasiswa
    for (const b of semuaBeasiswa) {
        await bayarSppDariBeasiswa(b.id_siswa, b.id_beasiswa, b.nominal);
    }
};
