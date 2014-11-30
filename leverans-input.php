<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Leverans Input</title>
  <meta name="description" content="Register you books">
  <link rel="stylesheet" href="css/meyer-reset.css">

  <!-- main.css-->
  <link rel="stylesheet" href="css/main.css">
</head>

  <body>
  <?php
  //if we have a post
 if($_POST) {

  //Connectiong to db
$servername = "localhost";
$username = "root";
$password = "mysql";
$dbname = "bookstore";

$con = mysqli_connect($servername, $username, $password, $dbname);

//if connection went wrong...
if (mysqli_connect_errno($con)) {
echo "Failed to connect to database: " . mysqli_connect_error();
}

  // Check if someone tries to post
  //Om man kör mysql eller mysqli måste vi använda stripe_tags för att inte folk ska kunna göra sql-injections
  $isbn=strip_tags($_POST['isbn']);
  $quantity=strip_tags($_POST['quantity']);
  $fprice=strip_tags($_POST['fprice']);
  $shelf=strip_tags($_POST['shelf']);

//Insert the data
$insert = mysqli_query($con, "INSERT INTO purchased (isbn, delivered_quantity, delivery_date, purchase_price, shelf)
  VALUES('$isbn','$quantity',CURRENT_TIMESTAMP,'$fprice','$shelf')");
//Vi skickar inte med purchase_id då den är AUTO_INCREMENT och kommer därför uppdateras automatiskt och ska därför inte skickas med.

/*
//Lathunden för den tidigare sql satsen

$sql="INSERT INTO purchased (purchase_id,isbn,delivered_quantity,delivery_date,purchase_price,shelf)
VALUES('NULL','$_POST[isbn]','$_POST[quantity]',CURRENT_TIMESTAMP,'$_POST[fprice]','$_POST[shelf]')";

//$sql2 = "INSERT INTO book_item (isbn,title,purchase_price,shelf)
//VALUES('$_POST[isbn]','$_POST[titel]','$_POST[fprice]','$_POST[shelf]')";
*/

  // If Success
  // Lets user know
  echo "<h2>En ny bok tillagd till registret</h2><br/>";

  // Give option to add new book
  echo "<a href='leverans.php'>För in en ny bok</a><br/>";

  //Or Return to Main Page
  echo "<a href='index.php'>Tillbaka till Framsidan</a>";

// Lets close the connection
mysqli_close($con);
//Bye Bye PHP
} 
else
{
    //if we Don't have a post
  //Visar felmeddlande 2 om man försöker accessa leverans-input.php utan att ha skickat en post i formuläret.
  echo 'Något gick fel kunde inte komuninicera med databasen var vänlig fyll i formuläret igen.';
}
?>
</body>
</html>