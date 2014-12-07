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
<!-- Select all from correct table -->

 $sql = 'SELECT * FROM current_stock_extended';

 $result = mysql_query($sql,$conn);

 <!-- Fetch the data from table -->

  $data = array();
 while($row = mysql_fetch_array($result)){
  $row_data = array(
   'isbn' => $row['isbn'],
   'current_stock' => $row['current_stock'],
    'author_first_name' => $row['author_first_name'],
    'author_first_name' => $row['author_first_name'],
    'description' => $row['description']
   );
  array_push($data, $row_data);
 }
