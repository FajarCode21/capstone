import db from "../db/index.js";

export const getEmoney = async (id_emoney) => {
    const result = await db.query(
        `
        select * from emoney where id_emoney = $1;
        `,
        [id_emoney]
    );

    return result.rows[0];
};
export const updateEmoney = async (id_emoney, nominal) => {
    const result = await db.query(
        `
        update emoney set nominal = $2
        where id_emoney = $1 returning *;
        `,
        [id_emoney, nominal]
    );

    return result.rows[0];
};

export const insertRiwayat = async (id_emoney, nominal, keterangan, tipe) => {
    const result = await db.query(
        `
        insert into riwayat_emoney (id_emoney, nominal, keterangan, id_tipe_emoney) values ($1, $2, $3, $4) returning *
        `,
        [id_emoney, nominal, keterangan, tipe]
    );

    return result.rows[0];
};

export const getAllEmoneyUsers = async (input, kelas, offset, limit) => {
    const result = await db.query(
        `
        select e.id_emoney, s.nisn, s.nama_lengkap, s.kelas, e.nominal , count(*) over () as total
        from siswa s
        join emoney e using (id_siswa)
        where
        ($1 = '' or s.nisn ilike  $1 || '%' or s.nama_lengkap ilike '%' || $1 || '%') AND
        ($2 = '' or s.kelas ilike '%' || $2 || '%')
        limit ${limit} offset ${offset};
        `,
        [input, kelas]
    );

    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};

export const getEmoneyUser = async (id_siswa) => {
    const result = await db.query(
        `
        select s.nisn, s.nama_lengkap, s.kelas, e.nominal 
        from siswa s 
        join emoney e using (id_siswa) 
        where id_siswa = $1;`,
        [id_siswa]
    );
    return result.rows[0];
};

export const getRiwayatEmoney = async (
    id_siswa,
    offset,
    limit,
    tgl_awal,
    tgl_akhir
) => {
    const values = [id_siswa];
    let filterTanggal = "";
    if (tgl_awal && !tgl_akhir) {
        values.push(tgl_awal);
        filterTanggal = `AND r.tanggal >= $2::date`;
    }
    if (!tgl_awal && tgl_akhir) {
        values.push(tgl_akhir);
        filterTanggal = `AND r.tanggal <= ($2::date + interval '1 day')`;
    }
    if (tgl_awal && tgl_akhir) {
        values.push(tgl_awal, tgl_akhir);
        filterTanggal = `AND r.tanggal BETWEEN $2::date AND ($3::date + interval '1 day')`;
    }

    const result = await db.query(
        `
        select r.nominal, r.keterangan, t.nama_tipe, r.tanggal , count(*) over () as total
        from siswa
        join emoney e using (id_siswa)
        join riwayat_emoney r using (id_emoney)
        join tipe_emoney t using (id_tipe_emoney)
        where id_siswa = $1 
        ${filterTanggal}
        order by r.tanggal desc
        limit ${limit} offset ${offset};
        `,

        values
    );
    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};
