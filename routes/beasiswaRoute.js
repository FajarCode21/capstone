import express from "express";
const router = express.Router();

import { beasiswaController } from "../controllers/index.js";

router.post("/add-beasiswa", beasiswaController.insertBeasiswa);
router.get("/", beasiswaController.getAllBeasiswaUsers);
router.get("/search", beasiswaController.searchSiswa);
router.put("/update-beasiswa", beasiswaController.updateBeasiswa);
router.delete("/delete-beasiswa", beasiswaController.deleteBeasiswa);

export default router;
