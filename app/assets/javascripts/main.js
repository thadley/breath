
$(function() {

    /*==========  Initalize steller for parrallax header  ==========*/
    
    $.stellar();

    // /*==========  Initalize fit text for responsive text  ==========*/

    $(".fittext").fitText();

    /*==================================================================
    =            Hide elements if browser supports animation            =
    ==================================================================*/
    // messes up color fading

    // if(!Modernizr.cssanimations){
    //     //dont hide everything
    // } else {
    // $('.story-container, .story-image-container, .dot-container, .hr-container, .footer-container ').children().addClass('hide');
    // }
    
    /*-----  End of Hide elements if browser supports animation  ------*/
    
    
    /*=========================================================
    =            Use waypoint to trigger animation            =
    =========================================================*/
    // text presence
    
    $('.story-container, .story-image-container, .dot-container, .hr-container, .footer-container ').waypoint(function (direction) {

        if( direction == 'down'){

            if( $(this).children().data('delay') !== undefined ) {
                var delay = $(this).children().data('delay');
            } else {
                var delay = 0;
            }

            $(this).children().removeClass("hide").addClass("animated fadeInDown delay-" + delay );

        } else {

            $(this).children().addClass("hide").removeClass("animated fadeInDown");

        }

    }, { offset: '55%'});

    
    /*-----  End of Use waypoint to trigger animation  ------*/
    
    /*======================================================
    =            Waypoint for background colour            =
    ======================================================*/

     $('.color-change').waypoint(function (direction) {

        var colorUp = {
                backgroundColor: $(this).data('colorup')
            };            
        var colorDown = {
                backgroundColor: $(this).data('colordown')
            };

        if( direction == 'down'){

            $('body').animate( colorDown, 525 );

        } else {

            $('body').animate(colorUp, 525 );

        }

    }, { offset: '70%' });
    

    // -----  End of Waypoint for background colour  ------
    
        window.onload=toFlow;

        function toFlow(){
            $('.story-container, .dot-container, .hr-container').children().addClass('hide');
            $('.dot-first').children().removeClass('hide');;
        }
});

