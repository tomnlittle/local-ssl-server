import { Router } from 'express';
import * as morgan from 'morgan';

export const router = Router();

router.use(morgan('dev'));
router.all('/', (req, res) => res.status(200).json({ hello: 'world' }));
