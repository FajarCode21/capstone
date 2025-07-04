import { emoneyModel } from "../models/index.js";
export const addEmoney = async (req, res, next) => {
    try {
        const { id_emoney, nominal } = req.body;

        if (!id_emoney || !nominal || isNaN(nominal) || nominal <= 0) {
            return res
                .status(400)
                .json({ message: "Data Tidak Lengkap", status: "failed" });
        }

        const saldo = await emoneyModel.getEmoney(id_emoney);
        if (!saldo) {
            return res
                .status(400)
                .json({ message: "Data Tidak Valid", status: "failed" });
        }

        const add = parseInt(saldo.nominal) + parseInt(nominal);
        await emoneyModel.updateEmoney(id_emoney, add);
        await emoneyModel.insertRiwayat(
            id_emoney,
            nominal,
            "Penambahan dari admin",
            1
        );

        return res
            .status(200)
            .json({ message: "Penambahan saldo Berhasil", status: "success" });
    } catch (err) {
        next(err);
    }
};

export const reduceEmoney = async (req, res, next) => {
    try {
        const {
            id_emoney,
            nominal,
            keterangan = "Pengurangan dari admin",
        } = req.body;

        if (!id_emoney || !nominal || isNaN(nominal) || nominal <= 0) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }

        const saldo = await emoneyModel.getEmoney(id_emoney);
        if (!saldo) {
            return res
                .status(400)
                .json({ message: "Data Tidak Valid", status: "failed" });
        }

        if (parseInt(saldo.nominal) < parseInt(nominal)) {
            return res
                .status(400)
                .json({ message: "Saldo tidak mencukupi", status: "failed" });
        }

        const reduce = parseInt(saldo.nominal) - parseInt(nominal);
        await emoneyModel.updateEmoney(id_emoney, reduce);
        await emoneyModel.insertRiwayat(id_emoney, nominal, keterangan, 2);

        return res
            .status(200)
            .json({ message: "Pengurangan saldo Berhasil", status: "success" });
    } catch (err) {
        next(err);
    }
};

export const getAllEmoneyUsers = async (req, res, next) => {
    try {
        const { input = "", kelas = "", page = 1, limit = 10 } = req.query;
        if (isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }
        const offset = (page - 1) * limit;
        const result = await emoneyModel.getAllEmoneyUsers(
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

export const getEmoneyUser = async (req, res, next) => {
    try {
        const id_siswa = req.user.id;
        const {
            page = 1,
            limit = 10,
            tgl_awal = "",
            tgl_akhir = "",
        } = req.query;
        if (!id_siswa || isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }
        const offset = (page - 1) * limit;
        const result = await emoneyModel.getEmoneyUser(id_siswa);
        if (!result) {
            return res
                .status(400)
                .json({ message: "Siswa Tidak Ditemukan", status: "failed" });
        }
        const riwayat = await emoneyModel.getRiwayatEmoney(
            id_siswa,
            offset,
            limit,
            tgl_awal,
            tgl_akhir
        );
        return res.status(200).json({
            status: "success",
            data: result,
            riwayat: {
                pagination: {
                    page: parseInt(page),
                    limit: parseInt(limit),
                    totalPage: Math.ceil(riwayat.totalData / limit),
                },
                data: riwayat.data,
            },
        });
    } catch (err) {
        next(err);
    }
};
