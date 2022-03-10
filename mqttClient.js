const mqtt = require('mqtt');
const mongoose = require('mongoose');
const Temperature = require("./temp"); 

var url = 'mongodb://192.168.1.14:27017/IoTRefSystems';

const client = mqtt.connect('mqtt://192.168.1.14');

mongoose.connect(url, { useNewUrlParser: true})
    .then((result) => console.log('connected to db'))
    .catch((err) => console.log(err));

client.on('connect', function() {
    client.subscribe('Temperature', function() {
       console.log('Subscribed to Temperature topic....');
    })
})

client.on('message', function(topic, message) {
    // temp value
    tempValue = parseFloat(message);
    console.log(tempValue);
    // prepare for saving
    let tempDateVal = new Date().toLocaleString("en-US", { timeZone: "Europe/Athens"});
    console.log(tempDateVal);
    const temp = new Temperature({
        temperature: tempValue,
        tempDate: tempDateVal
    });
    // save to db
    temp.save()
        .then((result) => {
            console.log(result);
        })
        .catch((err) => {
            console.log(err);
        });
})
