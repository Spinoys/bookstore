 //inleverans-modul ajax
    $('#deliveries').submit(function(event) {

        //Form datan
        var formData = {
            'isbn'          : $('input[name=isbn]').val(),
            'title'         : $('input[name=title]').val(),
            'first_name'    : $('input[name=first_name]').val(),
            'last_name'     : $('input[name=last_name]').val(),
            'quantity'      : $('input[name=quantity]').val(),
            'fprice'        : $('input[name=fprice]').val(),
            'shelf'         : $('input[name=shelf]').val(),
            'description'   : $('input[name=description]').val()
        };

        $.ajax({
            beforeSend: function() {
             $("#inleverans_resultat_ajax").show().html('<img src="img/ajaxsnurra.gif">Laddar...');
                },
            type        : 'POST',
            url         : 'delivery.php',
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

                $("#inleverans_resultat_ajax").show().html('Leveransen är registrerad!');

            },
             error: function(xhr, status, error) {
            $("#inleverans_resultat_ajax").show().html('Kunde inte registrera leveransen.');
             }
        });
        // försäkrar oss om att den inte kan skickas som en vanlig php sida som behöver laddas om.
        event.preventDefault();
    });