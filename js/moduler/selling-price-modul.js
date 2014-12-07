
$("#change-sell-price").hide();

//selling-price-modul ajax
$('#sell_price_form').submit(function(event) {

    //Form data
    var formData = {
        'isbn'          : $('input[id=isbn]').val(),
        'sell_price'    : $('input[id=sell_price]').val(),
    };

    $.ajax({
        beforeSend: function() {
            $("#sell_price_result_ajax").show().html('<img src="img/ajaxsnurra.gif">Laddar...');
        },
        type        : 'POST',
        url         : 'change-selling-price.php',
        data        : formData, // our data object
        dataType    : 'json',
        success: function(data){
            //Getting data to console
            console.log(data);
            
            if(data === "Book doesn't exists!") {
                $("#sell_price_result_ajax").show().html('Boken finns inte!');
            } else if(data === "Something went wrong!"){
                $("#sell_price_result_ajax").show().html('Något blev fel!');
            } else {

            //clear input fields
                $('.form-input').find(':input').each(function() {
                    switch(this.type) {
                        case 'text':
                            $(this).val('');
                            break;
                    }
                });
                $("#sell_price_result_ajax").show().html('Nytt pris är tillagt!');
            }
        },
        error: function(xhr, status, error) {
            $("#sell_price_result_ajax").show().html('Kunde inte lägga till nytt pris.');
        }
    });
    // försäkrar oss om att den inte kan skickas som en vanlig php sida som behöver laddas om.
    event.preventDefault();
});