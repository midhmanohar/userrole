const express = require('express');
const app = express();

var mysql = require('mysql');

var bodyParser = require('body-parser');



var jsonParser = bodyParser.json();

var cors = require("cors");

app.use(cors());

var con =  mysql.createConnection({
    host: "localhost",
    user: "root",
    password : "mysql",
    database : "userrole_db"
});

con.connect(function(err){
    if(err){
        throw err;
    }

    console.log('connected');

    // con.query("create database userrole");
});


app.listen(3000,()=> console.log('Listening on port 3000'));



app.post("/login",jsonParser,function(req,res){

    if(req.body.username==undefined || req.body.password==undefined){
        res.status(500).send({error:"authentication failed"});
    }

    let username = req.body.username;
    let password = req.body.password;

    let qr = ` select * from User where username='${username}' and password='${password}' ` ;

    con.query(qr,function(err,result){
        if(err || result.length==0){
            res.status(500).send({error:"login failed"});
        }else{
            // console.log(result);
            res.status(200).send({success:"login success"});
        }
    });
    
});



app.post('/newuser',jsonParser,function(req,res){
    let user_id = req.body.user_id;
    let username = req.body.username;
    let password = req.body.password;
    let first_name = req.body.first_name;
    let last_name = req.body.last_name;

    let qr = `insert into User(user_id,username,password,first_name,last_name) values('${user_id}','${username}','${password}','${first_name}','${last_name}')` ;

    con.query(qr,(err,result)=>{
        if(err){
            // throw(err);
            res.send({error:"operation failed"});
        }else{
            res.send({success:"operation completed"});
        }
    })
});

app.patch('/modifyrole',function(req,res){

    let user_id = req.body.user_id;
    let role_id = req.body.role_id;

    let qr = `update usertorole set role_id = '${role_id}' where user_id = '${user_id}' `;

    con.query(qr,function(err,result){
        if(err){
            res.send({error:"error"});
        }else{
            res.send({success:"updation success"});
        }
    });
});


app.delete('/deleteuser/:id',function(req,res){
    
    let id = req.params.id;

    let qr = `delete from User where user_id = ${id}`;

    con.query(qr,(err,result)=>{
        if(err){
            res.send({error:"deletion failed"});
        }else{
            res.send({success:"record deleted"});
        }
    })
});