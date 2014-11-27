
<?php
//Firing up PHP

//Adding local database info
$servername = 127.0.0.1;
$username = "root";
$password = "mysql";
$dbname = "Bookstore";

//Create connection
$con = mysqli_connect($servername, $username, $password, $dbname);

//Check connection and return error message if connection fails
if (!$conn) {
  die("Woops, the connection to the database failed: " .mysqli_connect_error());
}

$sql = "INSERT INTO purchased (isbn, purchase_price, delivered_quantity, delivery_date, bookcase) VALUES ('9100451924', '100', '50', '2014-11-24', 'H4)";

if (mysqli_query($con, $sql)) {
  echo "Ny bok har lagts till";
} else {
  echo "Woops Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
}
?>
