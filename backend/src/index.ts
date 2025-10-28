import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import helmet from 'helmet';
import rateLimit from 'express-rate-limit';
dotenv.config();
const app = express();

const allowedOrigins = (process.env.CORS_ORIGINS || '').split(',').filter(Boolean)
app.use(cors({ origin: allowedOrigins.length ? allowedOrigins : true, methods: ['GET','POST','PUT','PATCH','DELETE'], credentials: true }))
app.use(helmet())
app.use(express.json({ limit: '1mb' }));

const limiter = rateLimit({ windowMs: 15 * 60 * 1000, max: 300 })
app.use(limiter)
app.get('/health', (_req, res) => { res.json({ status: 'ok' }); });

app.listen(process.env.PORT || 3000, () => {
  console.log(`Server is running on port ${process.env.PORT || 3000}`);
});