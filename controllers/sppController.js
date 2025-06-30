import { sppModel } from "../models/index.js";

export const insertSppByAdmin = async (req, res, next) => {
    try {
        const { id_siswa, nominal, semester } = req.body;
        if (
            !id_siswa ||
            !nominal ||
            isNaN(nominal) ||
            nominal <= 0 ||
            !semester
        ) {
            return res
                .status(400)
                .json({ message: "Data Tidak Lengkap", status: "failed" });
        }

        const getIdSpp = await sppModel.getIdSpp(id_siswa, semester);
        if (!getIdSpp) {
            return res
                .status(400)
                .json({ message: "SPP Tidak Ditemukan", status: "failed" });
        }

        const id_spp = getIdSpp[0].id_spp;

        const totalTagihan = await sppModel.getTotalTagihan(id_spp);
        const totalPembayaran = await sppModel.getTotalPembayaran(id_spp);

        const tagihan = parseInt(totalTagihan?.total || 0);
        const pembayaran = parseInt(totalPembayaran?.total || 0);
        const lunas = parseInt(tagihan) === parseInt(pembayaran) ? true : false;
        if (lunas) {
            return res
                .status(400)
                .json({ message: "SPP Sudah Lunas", status: "failed" });
        }

        const cek =
            parseInt(tagihan) < parseInt(nominal) + parseInt(pembayaran)
                ? true
                : false;

        if (cek) {
            return res.status(400).json({
                message: "Nominal melebihi tagihan",
                status: "failed",
            });
        }

        const result = await sppModel.insertSpp(
            id_spp,
            nominal,
            "Pembayaran dari Admin"
        );

        return res.status(200).json({
            message: "SPP Berhasil Ditambahkan",
            status: "success",
            data: result,
        });
    } catch (err) {
        next(err);
    }
};

export const getAllSpp = async (req, res, next) => {
    try {
        const {
            input = "",
            kelas = "",
            semester = "",
            page = 1,
            limit = 10,
        } = req.query;
        if (isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }
        const offset = (page - 1) * limit;
        const result = await sppModel.getAllSPP(
            input,
            kelas,
            semester,
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

export const getAllPembayaran = async (req, res, next) => {
    try {
        const { input = "", kelas = "", page = 1, limit = 10 } = req.query;
        if (isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }
        const offset = (page - 1) * limit;
        const result = await sppModel.getAllPembayaran(
            input,
            kelas,
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

export const getSPPUser = async (req, res, next) => {
    try {
        const { id_siswa } = req.params;
        if (!id_siswa) {
            return res
                .status(400)
                .json({ message: "Invalid ID", status: "failed" });
        }
        const profile = await sppModel.getSPPUser(id_siswa);
        const spp_component = await sppModel.getSPPComponent(id_siswa);
        const detail_spp = await sppModel.getDetailSPPUser(id_siswa);
        return res.status(200).json({
            status: "success",
            data: {
                profile,
                spp_component,
                detail_spp,
            },
        });
    } catch (err) {
        next(err);
    }
};
