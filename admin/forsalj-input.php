<?php
//Includes the magic connector!
include 'pdo_helper.php';

//if we have a post
if(isset($_POST['isbn'], $_POST['sales_quantity'])) {

    $isbn = strip_tags($_POST['isbn']);
    $sales_quantity = strip_tags($_POST['sales_quantity']);


        //check if book exists:
    if(bookExists($dbh, $isbn)) {
   
        //add new quantity of sales
        $dbh->query("INSERT INTO sales (isbn, sales_quantity, change_date)
        VALUES('$isbn', '$sales_quantity', CURRENT_TIMESTAMP)");

        $result = $dbh->jsonQuery("SELECT * FROM sales ORDER BY change_date DESC LIMIT 1");
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