const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
const port = 8080; // Your desired port

// Use CORS middleware to allow requests from your Flutter app
app.use(cors());
app.use(express.json());

// MongoDB connection string (replace with your own)
const mongoUri = 'mongodb+srv://yoshuaraju:yoshuaraju@cluster0.vcsxy.mongodb.net/campusConnect?retryWrites=true&w=majority';

// Connect to MongoDB
// mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
//   .then(() => {
//     console.log('Connected to MongoDB');
//   })
//   .catch((err) => {
//     console.error('Error connecting to MongoDB:', err);
//   });
mongoose.connect(mongoUri)
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((err) => {
    console.error('Error connecting to MongoDB:', err);
  });


// Define a Mongoose schema for the event collection
const eventSchema = new mongoose.Schema({
  ename: { type: String, required: true },   // Event name
  cood1: { type: String, required: true },   // Coordinator 1
  cood2: { type: String, required: true },   // Coordinator 2
  loc: { type: String, required: true },     // Location
  createdAt: { type: Date, default: Date.now } // Automatically add a creation timestamp
},{ collection: 'Event' } );

// Create a Mongoose model for the Event
const Event = mongoose.model('Event', eventSchema);

// Endpoint to get events
// app.get('/events', async (req, res) => {
//   try {
//     const events = await Event.find(); // Fetch all events from the MongoDB collection
//     res.json(events);
//   } catch (error) {
//     console.error('Error fetching events:', error);
//     res.status(500).send('Error fetching events');
//   }
// });
app.get('/events', async (req, res) => {
  try {
    const events = await Event.find();
    //console.log(events); // Log the retrieved events
    res.json(events);
  } catch (error) {
    console.error('Error fetching events:', error);
    res.status(500).send('Error fetching events');
  }
});

// Endpoint to add a new event
app.post('/events', async (req, res) => {
  const { ename, cood1, cood2, loc } = req.body;

  // Ensure all required fields are provided
  if (!ename || !cood1 || !cood2 || !loc) {
    return res.status(400).send('All fields are required');
  }

  try {
    // Create a new event
    const newEvent = new Event({
      ename,
      cood1,
      cood2,
      loc,
    });

    await newEvent.save();
    res.status(201).json(newEvent);
  } catch (error) {
    console.error('Error creating event:', error);
    res.status(500).send('Error creating event');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});



/*
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
*/