import { readFileSync } from 'fs';
import * as rp from 'request-promise';

import { PORT } from './config';

const { CA_CERT_PATH, TARGET_HOST = 'localhost' }: {
  TARGET_HOST: string;
  CA_CERT_PATH: string;
} = <any> process.env;

const CA_CERT = readFileSync(CA_CERT_PATH);

async function request(protocol: string): Promise<any> {

  const url = TARGET_HOST + ':' + PORT;

  return rp(`${protocol}://${url}/`, {
    agentOptions: {
      ca: CA_CERT
    },
    resolveWithFullResponse: true
  });
}

describe('Api Tests', () => {

  it('HTTPS Request', async () => {
    const { statusCode } = await request('https');

    expect(statusCode).toEqual(200);
  });

  it('HTTP Request', async () => {

    expect.assertions(1);

    try {
      await request('http');
    } catch (e) {
      expect(e.message).toEqual('Error: socket hang up');
    }

  });
});
