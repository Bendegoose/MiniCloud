const express = require('express');
const cors = require('cors');
const notFound = require('./middleware/not-found');
require('dotenv').config();


const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => {
  res.status(200).json({ health: 'ok' });
});

app.get('/api/status', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.use(notFound);

app.listen(PORT, () => {
  console.log(`Backend running: http://localhost:${PORT}`);
});