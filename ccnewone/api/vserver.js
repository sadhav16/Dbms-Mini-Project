const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const mongoUri = 'mongodb+srv://yoshuaraju:yoshuaraju@cluster0.vcsxy.mongodb.net/campusConnect?retryWrites=true&w=majority&appName=Cluster0';

mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('Error connecting to MongoDB:', err));

const eventSchema = new mongoose.Schema({
  ename: { type: String, required: true },
  cood1: { type: String, required: true },
  cood2: { type: String, required: true },
  loc: { type: String, required: true },
  createdAt: { type: Date, default: Date.now }
}, { collection: 'Event' });

const Event = mongoose.model('Event', eventSchema);

app.get('/events', async (req, res) => {
  try {
    const events = await Event.find();
    res.json(events);
  } catch (error) {
    console.error('Error fetching events:', error);
    res.status(500).send('Error fetching events');
  }
});

app.post('/events', async (req, res) => {
  const { ename, cood1, cood2, loc } = req.body;
  if (!ename || !cood1 || !cood2 || !loc) {
    return res.status(400).send('All fields are required');
  }
  try {
    const newEvent = new Event({ ename, cood1, cood2, loc });
    await newEvent.save();
    res.status(201).json(newEvent);
  } catch (error) {
    console.error('Error creating event:', error);
    res.status(500).send('Error creating event');
  }
});

module.exports = app;
