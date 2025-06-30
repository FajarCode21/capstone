import { beasiswaModel } from "../models/index.js";

const bayarSppDariBeasiswa = async (id_siswa, id_beasiswa, totalBeasiswa) => {
    const biayaSemester = await beasiswaModel.getBiayaSemester(id_siswa);
    const totalPembayaran = await beasiswaModel.getTotalPembayaran(id_siswa);

    let sisaBeasiswa = parseInt(totalBeasiswa || 0);

    for (const biaya of biayaSemester) {
        const bayar = totalPembayaran.find((p) => p.id_spp === biaya.id_spp);
        const totalBayar = parseInt(bayar?.total_pembayaran || 0);
        const totalTagihan = parseInt(biaya.total_biaya || 0);

        const tunggakan = totalTagihan - totalBayar;

        if (tunggakan > 0 && sisaBeasiswa > 0) {
            const dibayar = Math.min(tunggakan, sisaBeasiswa);

            await beasiswaModel.insertSPPBeasiswa(
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
        await beasiswaModel.insertTabunganBeasiswa(
            id_beasiswa,
            id_siswa,
            sisaBeasiswa
        );
    }

    return true;
};

export const insertBeasiswa = async (req, res, next) => {
    try {
        const { id_siswa, id_beasiswa_component, nominal } = req.body;
        if (
            !id_siswa ||
            !id_beasiswa_component ||
            !nominal ||
            isNaN(nominal) ||
            nominal <= 0
        ) {
            return res
                .status(400)
                .json({ message: "Data Tidak Lengkap", status: "failed" });
        }

        const result = await beasiswaModel.insertBeasiswa(
            id_siswa,
            id_beasiswa_component,
            nominal
        );

        const pembayaran = await bayarSppDariBeasiswa(
            id_siswa,
            result.id_beasiswa,
            nominal
        );

        return res.status(200).json({
            message: "Beasiswa Berhasil Ditambahkan",
            status: "success",
            data: result,
            pembayaran,
        });
    } catch (err) {
        next(err);
    }
};

export const getAllBeasiswaUsers = async (req, res, next) => {
    try {
        const { input = "", filter = "", page = 1, limit = 10 } = req.query;
        if (isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }
        const offset = (page - 1) * limit;
        const result = await beasiswaModel.getAllBeasiswaUsers(
            input,
            filter,
            offset,
            limit
        );
        return res.status(200).json({
            status: "success",
            pagination: {
                page: parseInt(page),
                limit: parseInt(limit),
                totalPage: Math.ceil(result.totalData / limit),
            },
            data: result.data,
        });
    } catch (err) {
        next(err);
    }
};

export const updateBeasiswa = async (req, res, next) => {
    try {
        const { id_siswa, id_beasiswa, nominal, id_beasiswa_component } =
            req.body;
        if (
            !id_beasiswa ||
            !nominal ||
            !id_beasiswa_component ||
            isNaN(nominal) ||
            nominal <= 0
        ) {
            return res
                .status(400)
                .json({ message: "Data Tidak Lengkap", status: "failed" });
        }

        const cekID = await beasiswaModel.cekID(id_beasiswa, id_siswa);

        if (cekID.length === 0) {
            return res.status(400).json({
                message: "Beasiswa Tidak Ditemukan",
                status: "failed",
            });
        }

        await beasiswaModel.deleteBeasiswa(id_beasiswa);

        const result = await beasiswaModel.insertBeasiswa(
            id_siswa,
            id_beasiswa_component,
            nominal
        );

        const pembayaran = await bayarSppDariBeasiswa(
            id_siswa,
            result.id_beasiswa,
            nominal
        );

        return res.status(200).json({
            message: "Beasiswa Berhasil Ditambahkan",
            status: "success",
            data: result,
            pembayaran,
        });
    } catch (err) {
        next(err);
    }
};

export const deleteBeasiswa = async (req, res, next) => {
    try {
        const { id_beasiswa } = req.params;
        if (!id_beasiswa) {
            return res
                .status(400)
                .json({ message: "ID Beasiswa Tidak Valid", status: "failed" });
        }

        await beasiswaModel.deleteBeasiswa(id_beasiswa);

        return res
            .status(200)
            .json({ message: "Beasiswa Berhasil Dihapus", status: "success" });
    } catch (err) {
        next(err);
    }
};

export const searchSiswa = async (req, res, next) => {
    try {
        const { input = "" } = req.query;
        const result = await beasiswaModel.searchSiswa(input);
        return res.status(200).json({ status: "success", data: result });
    } catch (err) {
        next(err);
    }
};
