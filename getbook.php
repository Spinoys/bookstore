<?php
 $conn = mysql_connect('localhost','root','mysql');
 if(!$conn){
  die('Mysql connection error '.mysql_error());
 }


// Connect to the correct database

 $db = mysql_select_db('bookstore',$conn);
 if(!$db){
  die('Database selection failed '.mysql_error());
 }

// Support for Swedish Letters
 mysql_query("SET NAMES utf8");

// Select all from correct table

 $sql = 'SELECT * FROM current_stock_extended_and_present_prices_with_vat';

 $result = mysql_query($sql,$conn);


 // Fetch the data from table

  $data = array();
 while($row = mysql_fetch_array($result)){
  $row_data = array(
   'isbn' => $row['isbn'],
      'title' => $row['title'],
    'author_first_name' => $row['author_first_name'],
    'author_last_name' => $row['author_last_name'],
        'description' => $row['description'],
    'current_stock' => $row['current_stock'],
    'price_with_vat' => $row['price_with_vat']
   );
  array_push($data, $row_data);
 }

  // Echo the results, send them back as JSON

 echo json_encode($data);

?>
