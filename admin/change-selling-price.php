<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'], $_POST['sell_price'])) {

	$isbn = strip_tags($_POST['isbn']);
	$sell_price = strip_tags($_POST['sell_price']);

	//check if book exists:
	if(bookExists($dbh, $isbn)) {
		//add new price
  		$dbh->query("INSERT INTO price_history (isbn, sell_price, change_date)
  		VALUES('$isbn', '$sell_price', CURRENT_TIMESTAMP)");

  		$result = $dbh->jsonQuery("SELECT * FROM price_history ORDER BY change_date DESC LIMIT 1");
		// Eka ut JSON:en till din AJAX-drivna webb:
		echo json_encode($result);
	} else {
		echo json_encode("Book doesn't exists!");
	}
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

?>