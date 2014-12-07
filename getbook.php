<?php
 $conn = mysql_connect('localhost','root','mysql');
 if(!$conn){
  die('Mysql connection error '.mysql_error());
 }

 <!-- Connect to the correct database -->

 $db = mysql_select_db('bookstore',$conn);
 if(!$db){
  die('Database selection failed '.mysql_error());
 }
