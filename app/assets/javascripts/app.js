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
       
    });
});
