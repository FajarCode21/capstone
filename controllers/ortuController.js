import { ortuModel } from "../models/index.js";

export const getSiswaByIdOrtu = async (req, res, next) => {
    try {
        const { id_ortu } = req.params;
        const result = await ortuModel.getSIswaByIdOrtu(id_ortu);
        return res.status(200).json({ status: "success", data: result });
    } catch (err) {
        next(err);
    }
};
