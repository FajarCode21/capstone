import db from "../db/index.js";
export const insertBeasiswa = async (
    id_siswa,
    id_beasiswa_component,
    nominal
) => {
    const result = await db.query(
        `
        insert into beasiswa (id_siswa, id_beasiswa_component, nominal) values ($1, $2, $3) returning *
        `,
        [id_siswa, id_beasiswa_component, nominal]
    );

    return result.rows[0];
};

export const getAllBeasiswaUsers = async (input, filter, offset, limit) => {
    const result = await db.query(
        `
        select b.id_beasiswa,s.id_siswa, s.nisn, s.nama_lengkap, s.kelas, bc.keterangan, b.nominal, count(*) over () as total
        from siswa s
        join beasiswa b using (id_siswa)
        join beasiswa_components bc using (id_beasiswa_component)
        where
        ($1 = '' or s.nisn ilike  $1 || '%' or s.nama_lengkap ilike '%' || $1 || '%' or s.kelas ilike '%' || $1 || '%') AND
        ($2 = '' or bc.id_beasiswa_component = $2::int)
        limit ${limit} offset ${offset}
        `,
        [input, filter]
    );

    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};

export const updateBeasiswa = async (
    id_beasiswa,
    nominal,
    id_beasiswa_component
) => {
    const result = await db.query(
        `
        update beasiswa set nominal = $2, id_beasiswa_component = $3
        where id_beasiswa = $1 returning *;
        `,
        [id_beasiswa, nominal, id_beasiswa_component]
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
