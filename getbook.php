<?php
 $conn = mysql_connect('localhost','root','mysql');
 if(!$conn){
  die('Mysql connection error '.mysql_error());
 }
