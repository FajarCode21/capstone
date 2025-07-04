import express from "express";
const router = express.Router();

import { verifyUser, authorizeRole } from "../middlewares/authMiddleware.js";
import { beasiswaController } from "../controllers/index.js";

router.post(
    "/add-beasiswa",
    verifyUser,
    authorizeRole("admin"),
    beasiswaController.insertBeasiswa
);
router.get(
    "/",
    verifyUser,
    authorizeRole("admin", "kepala_sekolah"),
    beasiswaController.getAllBeasiswaUsers
);
router.get(
    "/search",
    verifyUser,
    authorizeRole("admin"),
    beasiswaController.searchSiswa
);
router.put(
    "/update-beasiswa",
    verifyUser,
    authorizeRole("admin"),
    beasiswaController.updateBeasiswa
);
router.delete(
    "/delete-beasiswa",
    verifyUser,
    authorizeRole("admin"),
    beasiswaController.deleteBeasiswa
);

export default router;
