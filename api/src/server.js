const app = require('./app');

app.get('/', (req, res) => {
    res.send('hello world');
});

app.listen(process.env.PORT || 3000, () => {
    console.log(`Server started for environment ${process.env.NODE_ENV} and listening to port ${process.env.PORT || 3000}`)
});