import { userModel } from "../models/index.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

const JWT_TOKEN = process.env.JWT_TOKEN;
export const login = async (req, res, next) => {
    const { email, password } = req.body;
    const userExist = await userModel.findUserByEmail(email);
    if (!userExist) {
        const err = new Error("User not found");
        err.status = 404;
        return next(err);
    }

    const valid = await bcrypt.compare(password, userExist.password);
    if (!valid) {
        const err = new Error("Wrong Pssword");
        err.status = 401;
        return next(err);
    }

    const token = jwt.sign(
        { id: userExist.id_user, email: userExist.email, role: userExist.role },
        JWT_TOKEN,
        { expiresIn: "15m" }
    );
    res.status(200).json({
        message: "Login Berhasil",
        token: token,
        status: "success",
        user: {
            id: userExist.id_user,
            nama: userExist.nama_lengkap,
            role: userExist.role,
        },
    });
};
