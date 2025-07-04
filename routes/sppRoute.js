import express from "express";
const router = express.Router();

import { verifyUser, authorizeRole } from "../middlewares/authMiddleware.js";
import { sppController } from "../controllers/index.js";

router.post(
    "/pembayaran/add-spp",
    verifyUser,
    authorizeRole("admin"),
    sppController.insertSppByAdmin
);
router.get(
    "/",
    verifyUser,
    authorizeRole("admin", "kepala_sekolah"),
    sppController.getAllSpp
);
router.get(
    "/pembayaran",
    verifyUser,
    authorizeRole("admin"),
    sppController.getAllPembayaran
);
router.get(
    "/siswa",
    verifyUser,
    authorizeRole("siswa"),
    sppController.getSPPUser
);

export default router;
