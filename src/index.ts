import * as express from 'express';
import { readFileSync } from 'fs';
import * as https from 'https';

import { CERT_PATH, KEY_PATH, PORT } from './config';
import { router } from './router';

const app = express().use(router);

const key = readFileSync(KEY_PATH);
const cert = readFileSync(CERT_PATH);

https.createServer({ key, cert }, app).listen(PORT);
