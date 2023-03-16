var con=require("./connection");
var express = require('express');
const path=require('path');
var app=express();
app.get('/',function(req,res){
    res.sendFile(path.join(__dirname,'../html/registration.html'));
});
app.listen(3000);






/*



var con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"root",
    database:"db_devjam"
})
con.connect(function(err){
    if(err)
    {
        throw err;
        console.log("Not con");
    }
    console.log("connected");})

var uname = document.getElementById("txt_uname").text;
var email=document.getElementById("txt_email").text;
var reg=document.getElementById("txt_reg").text;
var pass=document.getElementById("txt_pass").text;
var cpass=document.getElementById("txt_cpass").text;
var city = document.getElementById("dd_city").text;
var image=document.getElementById("btn_fu").value;
var course = document.getElementById("dd_course").text;
var gender;
if(document.getElementById("rb_male").checked)
    gender="Male";
else if(document.getElementById("rb_female").checked)
    gender="Female";
else    
    gender="Other";

function onClicksubmit()
{
    var sql="insert into tbl_register (stud_id,s_name,s_image,s_email,s_city,s_password,s_gender,s_course) values ('"+reg+"','"+uname+"','"+image+"','"+email+"','"+city+"','"+password+"','"+gender+"','"+course+"')";
    con.query(sql,function(err,result){
        if(err) throw err;
        console.log("Inserted succesfully!");});
}*/