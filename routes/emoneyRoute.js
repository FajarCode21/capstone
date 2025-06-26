import express from "express";
const router = express.Router();

import { emoneyController } from "../controllers/index.js";

router.post("/add-emoney", emoneyController.addEmoney);
router.post("/reduce-emoney", emoneyController.reduceEmoney);
router.get("/", emoneyController.getAllEmoneyUsers);
router.get("/:id_siswa", emoneyController.getEmoneyUser);

export default router;
