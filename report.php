<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'],$_POST['start_date'],$_POST['end_date'])) {

	$isbn = strip_tags($_POST['isbn']);
	$start_date = strip_tags($_POST['start_date']);
	$end_date = strip_tags($_POST['end_date']);

	if(bookExists($dbh, $isbn)) {
  		$result = $dbh->jsonQuery("SELECT ...");
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
