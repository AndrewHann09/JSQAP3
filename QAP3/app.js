const express = require('express');
const bodyParser = require('body-parser');
const methodOverride = require('method-override'); // Import method-override

const app = express();
const port = 3001;

app.set('view engine', 'ejs');

// Use body-parser middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Use method-override middleware
app.use(methodOverride('_method'));

// Include the routers
const indexRouter = require('./routes/index');
const apiRouter = require('./routes/apiRoutes');

// Use the routers
app.use('/', indexRouter);
app.use('/api', apiRouter);
app.use(express.static('public'));

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
