<html>
<body>

<?php //Fire up PHP

// Check if someone tries to post
if( $_POST )
//If the do connect to the database
{
  $con = mysql_connect("localhost","root","mysql");

  if (!$con)
  {
    die('Could not connect: ' . mysqli_error());
  }
// select database
  mysql_select_db("bookstore", $con);


// Get values from form
$isbn=$_POST['isbn'];
$quantity=$_POST['quantity'];
$titel=$_POST['titel'];
$fprice=$_POST['fprice'];
$shelf=$_POST['shelf'];


// Insert data into mysql
$sql="INSERT INTO purchased (purchase_id,isbn,delivered_quantity,delivery_date)
VALUES('NULL','$_POST[isbn]','$_POST[quantity]',CURRENT_TIMESTAMP)";

$sql2 = "INSERT INTO book_item (isbn,title,purchase_price,shelf)
VALUES('$_POST[isbn]','$_POST[titel]','$_POST[fprice]','$_POST[shelf]')";

// Check if "Successful".
if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }
  if (!mysql_query($sql2,$con))
  {
  die('Error: ' . mysql_error());
  }
echo "1 record added";

// close connection
mysql_close($con);
}
//Bye Bye PHP
?>

</body>
</html>
