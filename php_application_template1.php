<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'], $_POST['title'], $_POST['first_name'], $_POST['last_name'], $_POST['quantity'], $_POST['fprice'], $_POST['shelf'], $_POST['description'])) {

	$isbn = strip_tags($_POST['isbn']);
	$title = strip_tags($_POST['title']);
	$first_name = strip_tags($_POST['first_name']);
	$last_name = strip_tags($_POST['last_name']);
	$quantity = strip_tags($_POST['quantity']);
	$fprice = strip_tags($_POST['fprice']);
	$shelf = strip_tags($_POST['shelf']);
	$description = strip_tags($_POST['description']);

	$dbh->query("INSERT INTO purchased (isbn, delivered_quantity, delivery_date, purchase_price, shelf)
  VALUES('$isbn','$quantity',CURRENT_TIMESTAMP,'$fprice','$shelf')");

	//echo "<h2>En ny bok tillagd till registret</h2><br>";

	// Give option to add new book
	//echo "<a href='leverans.php'>För in en ny bok</a><br>";

	//Or Return to Main Page
	//echo "<a href='index.php'>Tillbaka till Framsidan</a><br><br>";

//få ut datan i en dump
	/*
	$result = $dbh->query("SELECT * FROM purchased ORDER BY delivery_date DESC LIMIT 3");
	// Om du vill titta på resultatet rått/debugga:
	var_dump($result);
	 */
	$result = $dbh->jsonQuery("SELECT * FROM purchased ORDER BY delivery_date DESC LIMIT 3");
// Eka ut JSON:en till din AJAX-drivna webb:
	//echo ($result);
	echo json_encode($result);

} else {
	echo json_encode('Something went wrong!');
}
?>
