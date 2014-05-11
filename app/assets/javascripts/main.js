
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
    //      $('.story-container, .story-image-container, .dot-container, .hr-container, .footer-container ').children().addClass('hide');
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

    }, { offset: '55%' });

    
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
    
    
    // /*===========================================
    // =            Waypoint for header            =
    // ===========================================*/
    
    // $('#start').waypoint(function (direction) {

    //     if( direction == 'down'){

    //         $('#story-icons, #sub-title').fadeTo("300ms", 0);

    //     } else {

    //         $('#story-icons, #sub-title').fadeTo("300ms", 1);

    //     }

    // }, { offset: '55%' });
    
    
    // /*-----  End of Waypoint for header  ------*/

    // $(document).scrollTop( $("#header").offset().top );
    

        // window.onload=toBottom;

        // function toBottom(){
        //     window.scrollTo(0,20000)
        //     window.scrollTo(0, 0);
        // }
});

