$("#search-result").hide();

//report-modul ajax
$('#report-form').submit(function(event) {

    //Form data
    var formData = {
        'isbn'          : $('input[name=isbn]').val()
    };

    $.ajax({
        type        : 'POST',
        url         : 'report.php',
        data        : formData, // our data object
        dataType    : 'json',
        success: function(data){
            //Getting data to console
            console.log(data);
            
            $("#search-result").show();
            
            if(data !== "Book doesn't exists!" && data !== "Something went wrong!") {

                //add rows to table from result data
                //loop through result
                $.each(data, function(val, book) {
                    //for every book
                    var tr = $("<tr></tr>");
                    $("#result-table").append(tr);
                    /*
                    var tdIsbn = $("<td>"+book.isbn+"</td>");
                    tr.append(tdIsbn);
                    var tdTitle = $("<td>"+book.title+"</td>");
                    tr.append(tdTitle);
                    var tdPurchasePrice = $("<td>"+book.puchase_price+"</td>");
                    tr.append(tdPurchasePrice);
                    var tdSellingPrice = $("<td>"+book.selling_price+"</td>");
                    tr.append(tdSellingPrice);
                    var tdQuantitySold = $("<td>"+book.quantity_sold+"</td>");
                    tr.append(tdQuantitySold);
                    var tdPurchasePriceTotal = $("<td>"+book.purchase_price_total+</td>");
                    tr.append(tdPurchasePriceTotal);
                    var tdSellingPriceTotal = $("<td>"+book.selling_price_total+"</td>");
                    tr.append(tdSellingPriceTotal);
                    var tdProfit = $("<td>"+book.profit+"</td>");
                    tr.append(tdProfit);
                    etc etc */
                    
                }); //end of loop
            } else {
                var tr = $("<tr><td colspan='8'>Boken finns inte!</td></tr>");
                $("#result-table").append(tr);
            }

            //clear input fields
                $('.form-input').find(':input').each(function() {
                    switch(this.type) {
                        case 'text':
                            $(this).val('');
                            break;
                    }
                });
            
        },
        error: function(xhr, status, error) {
            //kunde inte hämta rapport
            $("#search-result").append("Kunde inte hämta rapport");
        }
    });
    // försäkrar oss om att den inte kan skickas som en vanlig php sida som behöver laddas om.
    event.preventDefault();
});