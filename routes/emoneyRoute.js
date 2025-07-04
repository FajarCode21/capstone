import express from "express";
const router = express.Router();

import { verifyUser, authorizeRole } from "../middlewares/authMiddleware.js";
import { emoneyController } from "../controllers/index.js";

router.post(
    "/add-emoney",
    verifyUser,
    authorizeRole("admin"),
    emoneyController.addEmoney
);
router.post(
    "/reduce-emoney",
    verifyUser,
    authorizeRole("admin"),
    emoneyController.reduceEmoney
);
router.get(
    "/",
    verifyUser,
    authorizeRole("admin", "kepala_sekolah"),
    emoneyController.getAllEmoneyUsers
);
router.get(
    "/siswa",
    verifyUser,
    authorizeRole("siswa"),
    emoneyController.getEmoneyUser
);

export default router;
