const { Pool } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'QAP3',
    password: 'art2200',
    port: 5432,
});

const getAllMenuItems = async () => {
    try {
        const { rows } = await pool.query('SELECT * FROM menu_items');
        return rows;
    } catch (error) {
        throw error;
    }
};

const addMenuItem = async (item_name, description, price) => {
    try {
        const { rows } = await pool.query(
            'INSERT INTO menu_items (item_name, description, price) VALUES ($1, $2, $3) RETURNING *',
            [item_name, description, price]
        );
        return rows[0];
    } catch (error) {
        throw error;
    }
};

const updateMenuItem = async (itemId, item_name, description, price) => {
    try {
        const { rows } = await pool.query(
            'UPDATE menu_items SET item_name = $1, description = $2, price = $3 WHERE item_id = $4 RETURNING *',
            [item_name, description, price, itemId]
        );
        return rows[0];
    } catch (error) {
        throw error;
    }
};

const patchMenuItem = async (itemId, updatedFields) => {
    const { item_name, description, price } = updatedFields;
    const setClauses = [];
    const values = [];
    let index = 1;

    if (item_name) {
        setClauses.push(`item_name = $${index}`);
        values.push(item_name);
        index++;
    }

    if (description) {
        setClauses.push(`description = $${index}`);
        values.push(description);
        index++;
    }

    if (price) {
        setClauses.push(`price = $${index}`);
        values.push(price);
        index++;
    }

    try {
        const { rows } = await pool.query(
            `UPDATE menu_items SET ${setClauses.join(', ')} WHERE item_id = $${index} RETURNING *`,
            [...values, itemId]
        );
        return rows[0];
    } catch (error) {
        throw error;
    }
};

const deleteMenuItem = async (itemId) => {
    try {
        await pool.query('DELETE FROM menu_items WHERE item_id = $1', [itemId]);
    } catch (error) {
        throw error;
    }
};

const getMenuItemById = async (itemId) => {
    try {
        const { rows } = await pool.query('SELECT * FROM menu_items WHERE item_id = $1', [itemId]);
        return rows[0];
    } catch (error) {
        throw error;
    }
};

module.exports = { getAllMenuItems, addMenuItem, updateMenuItem, patchMenuItem, deleteMenuItem, getMenuItemById};
