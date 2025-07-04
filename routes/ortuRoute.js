import express from "express";
const router = express.Router();

import { verifyUser, authorizeRole } from "../middlewares/authMiddleware.js";
import { ortuController } from "../controllers/index.js";
router.get(
    "/anak/spp",
    verifyUser,
    authorizeRole("orang_tua"),
    ortuController.getSPPbyIdOrangTua
);
router.get(
    "/anak/emoney",
    verifyUser,
    authorizeRole("orang_tua"),
    ortuController.getEmoneyByIdOrangTua
);
export default router;
