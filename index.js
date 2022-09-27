const express = require("express")
const app = express();
const cp = require("child_process")
//adding the storage upload package
const formidable = require('formidable');
// var path = require('path');
// import {hosting} from "./assets/js/webhosting.js";
// import {aman} from "./assets/js/webhosting"
//webhosting.js

    
app.get("/test", function (req,res){
    
    
        cp.exec('python face.py',(err, stdout, stderr) => {
            if (err) {
                console.log(stderr);
                res.send("Failed");
            }else{
            res.send("Success");
            console.log(stdout);
            
        }
});
});




app.get("/", function (req, res) {
    res.sendFile(__dirname + "/index.html")
});


app.use('/assets', express.static(__dirname + '/assets'));


app.listen(4000);