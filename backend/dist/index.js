"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const helmet_1 = __importDefault(require("helmet"));
const express_rate_limit_1 = __importDefault(require("express-rate-limit"));
dotenv_1.default.config();
const app = (0, express_1.default)();
const allowedOrigins = (process.env.CORS_ORIGINS || '').split(',').filter(Boolean);
app.use((0, cors_1.default)({ origin: allowedOrigins.length ? allowedOrigins : true, methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'], credentials: true }));
app.use((0, helmet_1.default)());
app.use(express_1.default.json({ limit: '1mb' }));
const limiter = (0, express_rate_limit_1.default)({ windowMs: 15 * 60 * 1000, max: 300 });
app.use(limiter);
app.get('/health', (_req, res) => { res.json({ status: 'ok' }); });
app.listen(process.env.PORT || 3000, () => {
    console.log(`Server is running on port ${process.env.PORT || 3000}`);
});
//# sourceMappingURL=index.js.map