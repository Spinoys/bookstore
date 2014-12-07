<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if (isset($_POST['isbn'])) {

	$isbn = strip_tags($_POST['isbn']);

	$result = $dbh->jsonQuery("SELECT");

	// Eka ut JSON:en till din AJAX-drivna webb:
	echo json_encode($result);
} else {
	echo json_encode('Something went wrong!');
}

?>