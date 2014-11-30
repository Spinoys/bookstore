<!DOCTYPE html>

<html>

  <head>
      <meta charset="utf-8">
      <title>Leverans Input</title>
      <meta name="description" content="Register you books">
      <link rel="stylesheet" href="css/meyer-reset.css">

      <!-- main.css-->
      <link rel="stylesheet" href="css/main.css">
      <head>

        <body>

          <!-- Fire up PHP -->

          <?php

          // Check if someone tries to post

            if( $_POST )

           // If they do
           // Lets connect to the database
          {
            $con = mysql_connect("localhost","root","mysql");

            if (!$con)
            {
              die('Could not connect: ' . mysqli_error());
            }

          // Select the Database we are going to write to
          // In this case Bookstore
            mysql_select_db("Bookstore", $con);


            // Get values from form
            //But from where?

              $isbn=$_POST['isbn'];
              $quantity=$_POST['quantity'];
              $date=$_POST['date'];
              $fprice=$_POST['fprice'];
              $shelf=$_POST['shelf'];


              // Insert the data we pulled
              // just above into mySQL
$sql="INSERT INTO purchased (purchase_id,isbn,delivered_quantity,delivery_date,purchase_price,shelf)
VALUES('NULL','$_POST[isbn]','$_POST[quantity]',CURRENT_TIMESTAMP,'$_POST[fprice]','$_POST[shelf]')";

//$sql2 = "INSERT INTO book_item (isbn,title,purchase_price,shelf)
//VALUES('$_POST[isbn]','$_POST[titel]','$_POST[fprice]','$_POST[shelf]')";

              // Check if operation is
              // "Successful"

if (!mysql_query($sql,$con))
  {
  die('Error: ' . mysql_error());
  }
//  if (!mysql_query($sql2,$con))
//  {
  die('Error: ' . mysql_error());
  }

  // If Success
  // Lets user know
  echo "<h2>En ny bok tillagd till registret</h2><br/>";

  // Give option to add new book
  echo "<a href='leverans.php'>För in en ny bok</a><br/>";

  //Or Return to Main Page
  echo "<a href='index.php'>Tillbaka till Framsidan</a>";

// Lets close the connection
  mysql_close($con);
  }

//Bye Bye PHP
?>

<!-- Bye! -->
</body>
</html>
