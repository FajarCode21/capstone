import express from "express";
const router = express.Router();

import { sppController } from "../controllers/index.js";

router.post("/pembayaran/add-spp", sppController.insertSppByAdmin);
router.get("/", sppController.getAllSpp);
router.get("/pembayaran", sppController.getAllPembayaran);
router.get("/:id_siswa", sppController.getSPPUser);

export default router;
