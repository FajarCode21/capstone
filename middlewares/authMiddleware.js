import jwt from "jsonwebtoken";
const JWT_TOKEN = process.env.JWT_TOKEN;

export const verifyUser = (req, res, next) => {
    const authHeader = req.headers["authorization"];
    const token = authHeader?.split(" ")[1];

    if (!token) {
        const err = new Error("Token not found");
        err.status = 401;
        return next(err);
    }

    try {
        const user = jwt.verify(token, JWT_TOKEN);
        req.user = user;
        next();
    } catch (err) {
        next(err);
    }
};

export const authorizeRole = (...allowedRoles) => {
    return (req, res, next) => {
        const user = req.user;

        if (!user || !allowedRoles.includes(user.role)) {
            const err = new Error("Akses ditolak");
            err.status = 403;
            return next(err);
        }

        next();
    };
};
