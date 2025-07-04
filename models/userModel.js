import db from "../db/index.js";

export const findUserByEmail = async (email) => {
    const result = await db.query(
        `select u.*, r.role_name as role from users u join role r on u.id_role = r.id_role  where email = $1;`,
        [email]
    );
    return result.rows[0];
};
