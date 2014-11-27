// DOM ready
$(function(){

  // Add a submit handler to the first form
  $('#deliveries').submit(submitDelivery);

  function submitDelivery(){
    // In a submit handler this
    // equals the form element
    var form = $(this);

    // Hide all on-error fields
    $('.on-error').hide();

    /*isbn validation
    ************************************************
    */
    // Read the value from the isbn input field
    var isbn = form.find('#isbn').val();


    // First remove all hyphens
    isbn = isbn.replace(/-/g,'');

    // Always add 978 to the isbn if shorter
    // than 13 characters
    if(isbn.length < 13){
      isbn = "978" + isbn;
    }


    // Check/validate the ISBN
    var isbnOK = true;

    // Check if the isbn has the length of 13 characters
    //and that it is only numbers
    isbnOK = isbn.length == 13 && !isNaN(isbn/1);

    // React on faulty isbn
    if(!isbnOK){
      // Show the user info about incorrect format
      $('.on-error.isbn').show();
      // Empty the isbn field
      form.find('#isbn').val('');
    }
    console.log(isbn, isbnOK);

    // Not working to temporarily turned off
/*
    /*fprice validation
    ************************************************
    */

    // Read the value from the fprice input field
    var fprice = form.find('#fprice').val();

    // Check/validate the fprice
    var fpriceOK = true;


   fpriceOK = !isNaN(fprice/1);
    // React on faulty fprice
    if(!fpriceOK){
      // Show the user info about incorrect format
      $('.on-error.fprice').show();
      // Empty the fprice field
      form.find('#fprice').val('');
    }
    console.log(fprice, fpriceOK);


    // Do not reload the page
    return false;
  }










});
