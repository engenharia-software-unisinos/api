const cors = require('cors');
const express = require('express');

class AppController {
    constructor() {

        this.middlewares();

        
        this.express = express();
        this.express.use(cors());
    }

    middlewares() {
        this.express(express.json());
    }    
}

module.exports = new AppController().express;