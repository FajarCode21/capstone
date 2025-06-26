import express from "express";
const router = express.Router();

import { ortuController } from "../controllers/index.js";
router.get("/anak/:id_ortu", ortuController.getSiswaByIdOrtu);
export default router;
