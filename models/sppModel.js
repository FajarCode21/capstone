import db from "../db/index.js";

export const insertSpp = async (id_spp, nominal, keterangan) => {
    const result = await db.query(
        `insert into spp_payments (id_spp, nominal, keterangan) values ($1, $2, $3) returning *;`,
        [id_spp, nominal, keterangan]
    );

    return result.rows[0];
};

export const getIdSpp = async (id_siswa, semester) => {
    const result = await db.query(
        `select id_spp from spp where id_siswa = $1 and semester = $2 ;`,
        [id_siswa, semester]
    );

    return result.rows;
};

export const getTotalTagihan = async (id_spp) => {
    const result = await db.query(
        `select sum(nominal) as total from spp_details where id_spp = $1;`,
        [id_spp]
    );

    return result.rows[0];
};

export const getTotalPembayaran = async (id_spp) => {
    const result = await db.query(
        `select sum(nominal) as total from spp_payments where id_spp = $1;`,
        [id_spp]
    );

    return result.rows[0];
};

export const getAllSPP = async (input, kelas, semester, offset, limit) => {
    const isAllFilterEmpty = !input && !kelas && !semester;
    const orderByClause = isAllFilterEmpty
        ? `ORDER BY p.tanggal_terakhir DESC NULLS LAST`
        : `ORDER BY s.nama_lengkap, sp.semester`;

    const result = await db.query(
        `
        SELECT 
            s.id_siswa,
            s.nisn,
            s.nama_lengkap,
            s.kelas,
            sp.semester,
            COALESCE(sd.total_biaya, 0) AS total_biaya,
            COALESCE(p.total_pembayaran, 0) AS total_pembayaran,
            GREATEST(COALESCE(sd.total_biaya, 0) - COALESCE(p.total_pembayaran, 0), 0) AS tunggakan,
            CASE 
                WHEN COALESCE(sd.total_biaya, 0) - COALESCE(p.total_pembayaran, 0) <= 0 THEN 'Lunas'
                ELSE 'Belum Lunas'
            END AS status,
            COALESCE(TO_CHAR(p.tanggal_terakhir, 'YYYY-MM-DD'), '-') AS tanggal_terakhir_bayar,
            COUNT(*) OVER() AS total
        FROM siswa s
        JOIN spp sp ON sp.id_siswa = s.id_siswa
        LEFT JOIN (
            SELECT id_spp, SUM(nominal) AS total_biaya
            FROM spp_details
            GROUP BY id_spp
        ) sd ON sd.id_spp = sp.id_spp
        LEFT JOIN (
            SELECT id_spp, SUM(nominal) AS total_pembayaran, MAX(tanggal) AS tanggal_terakhir
            FROM spp_payments
            GROUP BY id_spp
        ) p ON p.id_spp = sp.id_spp
        WHERE
            ($1 = '' OR s.nisn ILIKE $1 || '%'
                     OR s.nama_lengkap ILIKE '%' || $1 || '%') AND
            ($2 = '' OR s.kelas ILIKE '%' || $2 || '%') AND
            ($3 = '' OR sp.semester::text ILIKE '%' || $3 || '%')
        ${orderByClause}
        LIMIT ${limit} OFFSET ${offset};
        `,
        [input, kelas, semester]
    );

    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};

export const getAllPembayaran = async (input, kelas, offset, limit) => {
    const result = await db.query(
        `
        
        select s.id_siswa, s.nisn, s.nama_lengkap, s.kelas, count(*) over () as total from siswa s
        where
        ($1 = '' or s.nisn ilike  $1 || '%' or s.nama_lengkap ilike '%' || $1 || '%')
        and ($2 = '' or s.kelas ilike '%' || $2 || '%')
        limit ${limit} offset ${offset};
        `,
        [input, kelas]
    );

    const data = result.rows;
    const totalData = data.length > 0 ? parseInt(data[0].total) : 0;

    return { data, totalData };
};

export const getSPPUser = async (id_user) => {
    const result = await db.query(
        `select s.id_siswa, s.nisn, s.nama_lengkap, s.kelas 
        from users
        join siswa s using (id_user)
        where id_user = $1;`,
        [id_user]
    );

    return result.rows[0];
};

export const getSPPComponent = async (id_user) => {
    const result = await db.query(
        `
        select sd.id_spp, sd.keterangan, spp.semester, sd.nominal
        from spp_details sd
        JOIN spp using (id_spp)
        JOIN siswa using (id_siswa)
        JOIN users using (id_user)
        where id_user = $1
        `,
        [id_user]
    );

    return result.rows;
};

export const getDetailSPPUser = async (id_user) => {
    const result = await db.query(
        `
         SELECT 
            s.kelas,
            sp.semester,
            COALESCE(sd.total_biaya, 0) AS total_biaya,
            COALESCE(p.total_pembayaran, 0) AS total_pembayaran,
            GREATEST(COALESCE(sd.total_biaya, 0) - COALESCE(p.total_pembayaran, 0), 0) AS tunggakan,
            CASE 
                WHEN COALESCE(sd.total_biaya, 0) - COALESCE(p.total_pembayaran, 0) <= 0 THEN 'Lunas'
                ELSE 'Belum Lunas'
            END AS status,
            COALESCE(TO_CHAR(p.tanggal_terakhir, 'YYYY-MM-DD'), '-') AS tanggal_terakhir_bayar,
            COUNT(*) OVER() AS total
        FROM users
        JOIN siswa s using (id_user)
        JOIN spp sp ON sp.id_siswa = s.id_siswa
        LEFT JOIN (
            SELECT id_spp, SUM(nominal) AS total_biaya
            FROM spp_details
            GROUP BY id_spp
        ) sd ON sd.id_spp = sp.id_spp
        LEFT JOIN (
            SELECT id_spp, SUM(nominal) AS total_pembayaran, MAX(tanggal) AS tanggal_terakhir
            FROM spp_payments
            GROUP BY id_spp
        ) p ON p.id_spp = sp.id_spp

        WHERE users.id_user = $1

        order by sp.semester
        
        `,
        [id_user]
    );

    return result.rows;
};
