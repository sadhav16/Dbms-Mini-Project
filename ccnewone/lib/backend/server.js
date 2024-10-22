const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');

const app = express();
const port = 8080; // Your desired port

// Use CORS middleware to allow requests from your Flutter app
app.use(cors());
app.use(express.json());

// Set up PostgreSQL connection pool
const pool = new Pool({
  user: 'postgres', // Your database username
  host: 'localhost', // Database host
  database: 'postgres', // Your database name
  password: 'sadhav16', // Your database password
  port: 5432, // Database port
});

// Endpoint to get events
app.get('/events', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM event'); // Adjust the query as per your database
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error fetching events');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
