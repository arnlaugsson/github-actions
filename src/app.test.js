const request = require('supertest');
const app = require('./app');

describe('Server should responde', () => {
  it('should return 200 status code', async () => {
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
  });
  it('should respond with a greeting', async () => {
    const res = await request(app).get('/');
    expect(res.text).toEqual('Hello world!');
  });
});
