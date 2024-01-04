const express = require('express');
const app = express();

require('dotenv').config();

const port = process.env.PORT;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/health', (req, res) => {
  const health = {
    uptime: process.uptime(),
    message: 'Service is running',
    timestamp: Date.now()
  }
  res.json(health);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});