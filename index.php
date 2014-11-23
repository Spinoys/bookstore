//Firing up PHP
<?php

//Adding local database info
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "ourDB";

//Create connection
$con = mysqli_connect($servername, $username, $password, $dbname);

//Check connection and return error message if connection fails
if (!$conn) {
  die("Woops, the connection to the database failed: " .mysqli_connect_error());
}

$sql = "INSERT INTO Leverans (isbn, titel, author, fprice, deliverydate, numberdelivered)
VALUES ('12345', 'Book Titel', 'Författare', '100', 'datum', '5')";

if (mysqli_query($con, $sql)) {
  echo "Ny bok har lagts till";
} else {
  echo "Woops Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
}
