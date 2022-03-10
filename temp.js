const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const tempSchema = new Schema({
    temperature: {
        type: Number,
        required: true
    },
    tempDate: {
        type: Date,
        required: true
    }
})

const Temperature = mongoose.model('Temperature', tempSchema);

module.exports = Temperature;
