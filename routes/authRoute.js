import { authController } from "../controllers/index.js";
import express from "express";
const router = express.Router();

router.post("/login", authController.login);
export default router;
