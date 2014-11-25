<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Bookstore</title>
    <meta name="description" content="Awesome bookstore">
    <link rel="stylesheet" href="css/meyer-reset.css">

    <!-- main.css-->
    <link rel="stylesheet" href="css/main.css">
</head>

<body>
    <!-- App starts-->
    <header>
        <nav>

        </nav>
    </header>

    <main>
        <p>Hello world im ready to rock!</p>



    </main>

    <footer>

    </footer>
    <!-- App ends-->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <!-- jQuery fallback om jQuery inte kan laddas om google ligger nere eller är bannat i ett land kör vi jQuery från vår server måste vara i vanilla js! -->
    <script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
    <!-- Main.js here-->
    <script src="js/main.js"></script>
</body>

</html>


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