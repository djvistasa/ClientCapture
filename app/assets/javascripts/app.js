/**
 * Created by sive on 11/5/16.
 */
$(document).ready(function(){

    

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
        console.log('hello');
       $('#client-form').ajaxForm({
           url: "/create_client",
           beforeSubmit: function(){

           },
           success: function(){

           }
       });;
    });
});
