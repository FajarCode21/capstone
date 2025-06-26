import express from "express";
import cors from "cors";
import dotenv from "dotenv";

const app = express();
dotenv.config();
app.use(cors());
app.use(express.json());

import { createTables, syncTables } from "./migrate.js";
import router from "./routes/index.js";
import errorHandler from "./middlewares/errorHandler.js";

const port = process.env.PORT || 3000;

app.use("/api", router);
app.use(errorHandler);

app.listen(port, () => {
    createTables();
    syncTables();
    console.log(`App listening on port ${port}`);
});
