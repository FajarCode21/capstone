import db from "../db/index.js";

export const getSIswaByIdOrtu = async (id_ortu) => {
    const result = await db.query(
        `
        SELECT s.id_siswa, s.id_user, s.nama_lengkap
        FROM ortu_siswa os
        JOIN siswa s ON s.id_siswa = os.id_siswa
        WHERE os.id_ortu = $1;
        `,
        [id_ortu]
    );
    return result.rows;
};
