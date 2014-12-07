//forsaljning-modul ajax
    $('#sales').submit(function(event) {

        //Form datan
        var formData = {
            'isbn'          : $('input[name=isbn]').val(),
            'sales_quantity'      : $('input[name=sales_quantity]').val()
        };

        $.ajax({
            beforeSend: function() {
             $("#forsaljning_resultat_ajax").show().html('<img src="img/ajaxsnurra.gif">Laddar...');
                },
            type        : 'POST',
            url         : 'forsalj-input.php',
            data        : formData, // our data object
            dataType    : 'json',
            success: function(data){
                //Getting data to console
                console.log(data);
                
                //clear input fields
                $('.form-input').find(':input').each(function() {
                    switch(this.type) {
                        case 'text':
                            $(this).val('');
                            break;
                    }
                });

                $("#forsaljning_resultat_ajax").show().html('Försäljningen är registrerad!');

            },
             error: function(xhr, status, error) {
            $("#forsaljning_resultat_ajax").show().html('Kunde inte registrera försäljningen.');
             }
        });
        // försäkrar oss om att den inte kan skickas som en vanlig php sida som behöver laddas om.
        event.preventDefault();
    });