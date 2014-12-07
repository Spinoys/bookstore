$("#search-result").hide();

//report-modul ajax
$('#report').submit(function(event) {

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
            
            //check what data is
            //if...

            //add rows to table from result data
            //loop through result
            $.each(data, function(val, book) {
                    //for every book
                    var tr = $("<tr></tr>");
                    $("#result-table").append(tr);
                    /*
                    var td1 = $("<td>"+book.isbn+"</td>");
                    tr.append(td1);
                    var td2 = $("<td>"+book.title+"</td>");
                    tr.append(td2);
                    var td3 = $("<td>"+book.first_name+" "+book.last_name+"</td>");
                    tr.append(td3);
                    etc etc */
                    
                }); //end of loop


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