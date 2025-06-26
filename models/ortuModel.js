import db from "../db/index.js";

export const getSIswaByIdOrtu = async (id_ortu) => {
    const result = await db.query(
        `select id_siswa from siswa where id_orang_tua = $1;`,
        [id_ortu]
    );
    return result.rows;
};
