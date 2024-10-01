// Import modules
const express = require('express');
const cors = require('cors');
const mysql = require('mysql');

// Initialize app
const app = express();
const port = 3100;

// Enable CORS
app.use(cors());

// Create MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'jfkslfff',
    database: 'crowdfunding_db',
});

// Start server
app.listen(port, () => console.log(`Server running on port ${port}`));

// Fetch all active fundraisers
app.get('/fundraisers', (req, res) => {
    const query = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    db.query(query, handleQueryResponse(res));
});

// Get fundraiser details by ID
app.get('/fundraiser/:id', (req, res) => {
    const query = 'SELECT * FROM FUNDRAISER WHERE FUNDRAISER_ID = ?';
    db.query(query, [req.params.id], handleQueryResponse(res, true));
});

// Search fundraisers by criteria
app.get('/search', (req, res) => {
    const { organizer, city, category } = req.query;
    let query = 'SELECT * FROM FUNDRAISER WHERE ACTIVE = 1';
    const filters = [];

    // Build filters
    if (organizer) filters.push(`ORGANIZER LIKE '%${organizer}%'`);
    if (city) filters.push(`CITY LIKE '%${city}%'`);
    if (category) filters.push(`CATEGORY_ID = (SELECT CATEGORY_ID FROM CATEGORY WHERE NAME = '${category}')`);

    // Add filters to query
    if (filters.length > 0) query += ' AND ' + filters.join(' AND ');

    db.query(query, handleQueryResponse(res));
});

// Handle query response
function handleQueryResponse(res, isSingle = false) {
    return (err, results) => {
        if (err) return res.status(500).json({ error: err });
        if (isSingle && results.length === 0) return res.status(404).json({ error: 'Not found' });
        res.json(isSingle ? results[0] : results);
    };
}
