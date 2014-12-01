 //inleverans-modul ajax
    $('form').submit(function(event) {

        //Form datan
        var formData = {
            'isbn'     : $('input[name=isbn]').val(),
            'quantity' : $('input[name=quantity]').val(),
            'fprice'   : $('input[name=fprice]').val(),
            'shelf'    : $('input[name=shelf]').val()
        };

        $.ajax({
            beforeSend: function() {
             $("#inleverans_resultat_ajax").show().html('<img src="img/ajaxsnurra.gif">Laddar...');
                },
            type        : 'POST',
            url         : 'php_application_template1.php',
            data        : formData, // our data object
            dataType    : 'json',
            success: function(data){
                //Getting data to console
              console.log(data);
            $("#inleverans_resultat_ajax").show().html('En ny bok tillagd till registret.');

            },
             error: function(xhr, status, error) {
            $("#inleverans_resultat_ajax").show().html('Kunde inte uppdatera.');
             }
        });
        // försäkrar oss om att den inte kan skickas som en vanlig php sida som behöver laddas om.
        event.preventDefault();
    });