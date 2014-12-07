<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'], $_POST['sales_quantity'])) {
	$isbn = strip_tags($_POST['isbn']);
	$quantity = strip_tags($_POST['sales_quantity']);
	
	//book sold
	//register sale
	$dbh->query("INSERT INTO sales (isbn, sales_quantity, selling_date)
  	VALUES('$isbn', '$quantity', CURRENT_TIMESTAMP)");
  	

	$result = $dbh->jsonQuery("SELECT * FROM sales ORDER BY delivery_date DESC LIMIT 3");

// Eka ut JSON:en till din AJAX-drivna webb:
	//echo ($result);
	echo json_encode($result);
} else {
	echo json_encode('Something went wrong!');
}


?>