import db from "./db/index.js";

export const createTables = async () => {
    try {
        await db.query(`
        CREATE TABLE IF NOT EXISTS role (
            id_role SERIAL PRIMARY KEY,
            role_name VARCHAR(50) UNIQUE
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS users (
            id_user SERIAL PRIMARY KEY,
            email VARCHAR(255) UNIQUE,
            password VARCHAR(255),
            nama_lengkap VARCHAR(255),
            id_role INT REFERENCES role(id_role)
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS siswa (
            id_siswa SERIAL PRIMARY KEY,
            nisn VARCHAR(15) UNIQUE,
            nama_lengkap VARCHAR(100),
            kelas VARCHAR(10),
            id_user INT UNIQUE REFERENCES users(id_user)
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS ortu_siswa (
            id_ortu_siswa SERIAL PRIMARY KEY,
            id_ortu INT REFERENCES users(id_user) ON DELETE CASCADE,
            id_siswa INT REFERENCES siswa(id_siswa) ON DELETE CASCADE,
            CONSTRAINT unique_ortu_siswa UNIQUE (id_ortu, id_siswa)
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS emoney (
            id_emoney SERIAL PRIMARY KEY,
            id_siswa INT UNIQUE REFERENCES siswa(id_siswa),
            nominal INT DEFAULT 0
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS tipe_emoney (
            id_tipe_emoney SERIAL PRIMARY KEY,
            nama_tipe VARCHAR(50) UNIQUE
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS riwayat_emoney (
            id_riwayat_emoney SERIAL PRIMARY KEY,
            id_emoney INT REFERENCES emoney(id_emoney),
            nominal INT NOT NULL,
            keterangan TEXT,
            id_tipe_emoney INT REFERENCES tipe_emoney(id_tipe_emoney),
            tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS spp (
            id_spp SERIAL PRIMARY KEY,
            id_siswa INT REFERENCES siswa(id_siswa),
            semester INT NOT NULL,
            CONSTRAINT unique_siswa_semester UNIQUE (id_siswa, semester)
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS spp_template_components (
            id_template_component SERIAL PRIMARY KEY,
            semester INT,
            keterangan VARCHAR(100),
            nominal INT
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS spp_details (
            id_spp_detail SERIAL PRIMARY KEY,
            id_spp INT REFERENCES spp(id_spp),
            keterangan VARCHAR(100),
            nominal INT,
            CONSTRAINT unique_component_per_spp UNIQUE (id_spp, keterangan)
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS beasiswa (
            id_beasiswa SERIAL PRIMARY KEY,
            id_siswa INT REFERENCES siswa(id_siswa),
            keterangan VARCHAR(100),
            nominal INT NOT NULL,
            tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS spp_payments (
            id_spp_payment SERIAL PRIMARY KEY,
            id_spp INT REFERENCES spp(id_spp),
            nominal INT,
            keterangan TEXT,
            id_beasiswa INT REFERENCES beasiswa(id_beasiswa) ON DELETE CASCADE,
            tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        `);

        await db.query(`
        CREATE TABLE IF NOT EXISTS tabungan_beasiswa (
            id_tabungan SERIAL PRIMARY KEY,
            id_beasiswa INT REFERENCES beasiswa(id_beasiswa) ON DELETE CASCADE,
            id_siswa INT REFERENCES siswa(id_siswa) ON DELETE CASCADE,
            nominal INT NOT NULL CHECK (nominal >= 0),
            tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        `);

        console.log("Tables created successfully.");
    } catch (err) {
        console.log(err.stack);
        console.log("Error creating tables.");
    }
};

export const syncTables = async () => {
    try {
        await db.query(`
            INSERT INTO spp (id_siswa, semester)
            SELECT s.id_siswa, gs.semester
            FROM siswa s
            CROSS JOIN generate_series(1, 6) AS gs(semester)
            LEFT JOIN spp sp ON sp.id_siswa = s.id_siswa AND sp.semester = gs.semester
            WHERE sp.id_spp IS NULL;
            `);
        await db.query(` 
            INSERT INTO emoney (id_siswa, nominal)
            SELECT s.id_siswa, 0
            FROM siswa s
            LEFT JOIN emoney e ON e.id_siswa = s.id_siswa
            WHERE e.id_siswa IS NULL;`);

        await db.query(`
            INSERT INTO spp_details (id_spp, keterangan, nominal)
            SELECT sp.id_spp, tmpl.keterangan, tmpl.nominal
            FROM spp sp
            JOIN spp_template_components tmpl ON tmpl.semester = sp.semester
            LEFT JOIN spp_details sd ON sd.id_spp = sp.id_spp AND sd.keterangan = tmpl.keterangan
            WHERE sd.id_spp_detail IS NULL;
            `);
        console.log("Tables synced successfully.");
    } catch (err) {
        console.log("Error syncing tables:");
        console.log(err.stack);
    }
};
