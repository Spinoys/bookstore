<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'], $_POST['title'], $_POST['first_name'], $_POST['last_name'], $_POST['quantity'], $_POST['fprice'], $_POST['shelf'], $_POST['description'])) {

	$isbn = strip_tags($_POST['isbn']);

	$title = strip_tags($_POST['title']);
	$first_name = strip_tags($_POST['first_name']);
	$last_name = strip_tags($_POST['last_name']);
	$description = strip_tags($_POST['description']);
	$quantity = strip_tags($_POST['quantity']);
	$fprice = strip_tags($_POST['fprice']);
	$shelf = strip_tags($_POST['shelf']);
	$description = strip_tags($_POST['description']);

	//while book doesn't exists:
	while(!bookExists($dbh, $isbn)) {
		//while author doesn't exists:
		while(authorExists($dbh, $first_name, $last_name) === false) {
			//add author
			$dbh->query("INSERT INTO author (first_name, last_name)
  			VALUES('$first_name','$last_name')");
		}
		//author added/exists - get author id
		$authorId = authorExists($dbh, $first_name, $last_name);
		//add new book
		$dbh->query("INSERT INTO book_item (isbn, title, description, book_author_id)
  		VALUES('$isbn','$title','$description','$authorId')");
	}
	//book added/exists
	//register delivery
	$dbh->query("INSERT INTO purchased (isbn, delivered_quantity, delivery_date, purchase_price, shelf)
  	VALUES('$isbn', '$quantity', CURRENT_TIMESTAMP, '$fprice', '$shelf')");
  	
  	//add new price
  	$sellPrice = $fprice*1.8;
  	$dbh->query("INSERT INTO price_history (isbn, sell_price, change_date)
  	VALUES('$isbn', '$sellPrice', CURRENT_TIMESTAMP)");

	$result = $dbh->jsonQuery("SELECT * FROM purchased ORDER BY delivery_date DESC LIMIT 3");
// Eka ut JSON:en till din AJAX-drivna webb:
	//echo ($result);
	echo json_encode($result);
} else {
	echo json_encode('Something went wrong!');
}

function bookExists($dbh, $isbn) {
	$result = $dbh->jsonQuery("SELECT isbn FROM book_item WHERE isbn='$isbn'");
	$trimmed = trim($result, "[]");
	if($trimmed === '' || strlen($trimmed) === 0 || empty($trimmed)) {
		return false;
	} else {
		$resultArray = json_decode($result, true); 
		$isbnFromArray = $resultArray[0]['isbn'];
		if((string)$isbnFromArray === $isbn) {
			return true;
		} else {
			return false;
		}
	}
}

function authorExists($dbh, $first_name, $last_name) {
	$result = $dbh->jsonQuery("SELECT id, first_name, last_name FROM author WHERE first_name='$first_name' AND last_name='$last_name'");
	$trimmed = trim($result, "[]");
	if($trimmed === "" || strlen($trimmed) === 0 || empty($trimmed)) {
		return false;
	} else {
		$resultArray = json_decode($result, true);
		$authorIdFromArray = $resultArray[0]['id'];
		$firstNameFromArray = $resultArray[0]['first_name'];
		$lastNameFromArray = $resultArray[0]['last_name'];
		if((string)$firstNameFromArray === $first_name && (string)$lastNameFromArray === $last_name) {
			return $authorIdFromArray;
		} else {
			return false;
		}
	}
}

?>