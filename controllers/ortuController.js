import { ortuModel } from "../models/index.js";
import { sppModel } from "../models/index.js";
import { emoneyModel } from "../models/index.js";
export const getSPPbyIdOrangTua = async (req, res, next) => {
    try {
        const id_ortu = req.user.id;
        const siswaList = await ortuModel.getSIswaByIdOrtu(id_ortu);
        console.log(siswaList);

        if (!siswaList || siswaList.length === 0) {
            return res.status(404).json({
                status: "failed",
                message: "Tidak ada siswa yang terdaftar untuk orang tua ini",
            });
        }

        const result = await Promise.all(
            siswaList.map(async (siswa) => {
                console.log("id_user:", siswa.id_user); // Cek ulang

                const profile = await sppModel.getSPPUser(siswa.id_user);
                const spp_component = await sppModel.getSPPComponent(
                    siswa.id_user
                );
                const detail_spp = await sppModel.getDetailSPPUser(
                    siswa.id_user
                );

                return {
                    id_siswa: siswa.id_siswa,
                    nama_siswa: siswa.nama_lengkap,
                    profile,
                    spp_component,
                    detail_spp,
                };
            })
        );

        return res.status(200).json({
            status: "success",
            data: result,
        });
    } catch (err) {
        next(err);
    }
};

export const getEmoneyByIdOrangTua = async (req, res, next) => {
    try {
        const id_ortu = req.user.id;
        const {
            page = 1,
            limit = 10,
            tgl_awal = "",
            tgl_akhir = "",
        } = req.query;

        if (isNaN(page) || isNaN(limit) || page < 1 || limit < 1) {
            return res
                .status(400)
                .json({ message: "Bad Request", status: "failed" });
        }

        const siswaList = await ortuModel.getSIswaByIdOrtu(id_ortu);
        if (!siswaList || siswaList.length === 0) {
            return res.status(404).json({
                status: "failed",
                message: "Tidak ada siswa ditemukan untuk orang tua ini",
            });
        }

        const offset = (page - 1) * limit;

        const result = await Promise.all(
            siswaList.map(async (siswa) => {
                const emoney = await emoneyModel.getEmoneyUser(siswa.id_user);
                const riwayat = await emoneyModel.getRiwayatEmoney(
                    siswa.id_user,
                    offset,
                    limit,
                    tgl_awal,
                    tgl_akhir
                );

                return {
                    id_siswa: siswa.id_siswa,
                    nama_siswa: siswa.nama_lengkap,
                    emoney,
                    riwayat: {
                        pagination: {
                            page: parseInt(page),
                            limit: parseInt(limit),
                            totalPage: Math.ceil(riwayat.totalData / limit),
                        },
                        data: riwayat.data,
                    },
                };
            })
        );

        return res.status(200).json({
            status: "success",
            data: result,
        });
    } catch (err) {
        next(err);
    }
};
