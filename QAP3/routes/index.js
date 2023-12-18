const express = require('express');
const router = express.Router();
const dal = require('../dal/db');

// Define the route for /add
router.get('/add', (req, res) => {
    res.render('add', { title: 'Add New Menu Item' });
});

router.get('/html', async (req, res) => {
    try {
        const menuItems = await dal.getAllMenuItems();
        res.render('index.ejs', { title: 'Main Page', menuItems: menuItems });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

// Route for JSON data
router.get('/json', async (req, res) => {
    try {
        const menuItems = await dal.getAllMenuItems();
        res.json(menuItems);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});


// Update the route for /update to accept an id parameter
router.get('/update/:id', async (req, res) => {
    const itemId = req.params.id;
    try {
        const item = await dal.getMenuItemById(itemId);
        res.render('update', { title: 'Update Menu Item', itemId: itemId, item: item });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router;