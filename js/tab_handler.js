$(function() {

    //active a class on first tab
    var activeClass = 'start';
    //active modul is #start-modul so we hide all other tabs!
    $("#inleverans-modul,#forsaljning-modul,#rapporter-modul,#rapporter-modul").hide();

    //clicks on menu
    $("#mainNav a").click(function() {
        //removes active tab & add this active tab
        $('a').removeClass('active');
        $(this).addClass("active");

        //sets active class variable to current
        activeClass = $(this).attr('id');

        //sets all to module to hideNseek
        $(".modul").addClass("hideNseek");
        //remove hideNseek class from current
        $(activeClass).removeClass("hideNseek");

        //Show in console what class is active right now
        console.log('activeClass: ' + activeClass);



        function hideNseekFunc(showModule) {
            //Hides all with class hideNseek
            $('.hideNseek').hide();

            //Show correct module
            $('#' + showModule).fadeIn('slow');
        }

        if (activeClass == 'start') {
            //calling hideNseekFunc that shows and hide modules
            hideNseekFunc("start-modul");

            /*
            Add your code here for module start

            */

        }
        if (activeClass == 'inleverans') {
            //calling hideNseekFunc that shows and hide modules
            hideNseekFunc("inleverans-modul");

            /*
            Add your code here for module inleverans

            */
        }
        if (activeClass == 'forsaljning') {
            //calling hideNseekFunc that shows and hide modules
            hideNseekFunc("forsaljning-modul");

            /*
            Add your code here for module forsaljning

            */

        }
        if (activeClass == 'rapporter') {
            //calling hideNseekFunc that shows and hide modules
            hideNseekFunc("rapporter-modul");

            /*
            Add your code here for module rapporter

            */

        }
    });

});