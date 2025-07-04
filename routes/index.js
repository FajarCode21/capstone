import express from "express";
const router = express.Router();

import emoneyRoute from "./emoneyRoute.js";
import beasiswaRoute from "./beasiswaRoute.js";
import sppRoute from "./sppRoute.js";
import ortuRoute from "./ortuRoute.js";
import authRoute from "./authRoute.js";

router.use("/auth", authRoute);
router.use("/beasiswa", beasiswaRoute);
router.use("/emoney", emoneyRoute);
router.use("/spp", sppRoute);
router.use("/orang-tua", ortuRoute);

export default router;
