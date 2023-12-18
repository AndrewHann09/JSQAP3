const express = require('express');
const router = express.Router(); // Ensure that express.Router() is invoked
const dal = require('../dal/db');

// GET all menu items
router.get('/menu-items', async (req, res) => {
    try {
        const menuItems = await dal.getAllMenuItems();
        res.json(menuItems);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

// POST new menu item
router.post('/add', async (req, res) => {
    const { item_name, description, price } = req.body;
    try {
        const newItem = await dal.addMenuItem(item_name, description, price);
        res.status(201).json(newItem);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

// PUT update menu item
router.put('/update/:id', async (req, res) => {
    const itemId = req.params.id;
    const { item_name, description, price } = req.body;
    try {
        const updatedItem = await dal.updateMenuItem(itemId, item_name, description, price);
        res.json(updatedItem);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

// PATCH update specific fields of a menu item
router.patch('/menu-items/:id', async (req, res) => {
    const itemId = req.params.id;
    const { item_name, description, price } = req.body;
    try {
        const patchedItem = await dal.patchMenuItem(itemId, { item_name, description, price });
        res.json(patchedItem);
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

// DELETE menu item
router.delete('/menu-items/:id', async (req, res) => {
    const itemId = req.params.id;
    try {
        await dal.deleteMenuItem(itemId);
        res.status(204).send();
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});


// GET menu item by ID
router.get('/menu-items/:id', async (req, res) => {
    const itemId = req.params.id;
    try {
        const menuItem = await dal.getMenuItemById(itemId);
        res.render('update', { title: 'Update Menu Item', item: menuItem });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router; // Export the router instance