/**
 * Created by sive on 11/5/16.
 */
$(document).ready(function(){

    $('#client-form').ajaxForm({
        url: '/create_client',
        type: 'POST',
        dataType: 'script',
        beforeSubmit: function(){
            console.log('hello');
        },
        success: function(){
            $('.formOverlay').css('display', 'none');
        }
    });

    $('body').on('click', '.logout', function(){
        $.ajax({
            url: '/admin_logout',
            dataType: 'script',
            beforeSend: function(){

            },
            data: {},
            success: function(data) {
                location.reload();
            }
        });
    });

    $('body').on('click', '.add-client', function(){
       $('.formOverlay').css('display', 'block');
    });
    $('body').on('click', '.close-form', function(){
       $('.formOverlay').css('display', 'none');
    });

    $('body').on('click', '.submit', function(){


    });


    $('body').on('click', '.add-client', function(){
        $('.formOverlay').show();
    });

});
