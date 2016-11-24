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

    $('#case-form').ajaxForm({
        url: '/case',
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
       $('.formOverlay').show('600');
    });
    $('body').on('click', '.close-form', function(){
       $('.formOverlay').hide('600');
    });

    $('body').on('click', '.Edit', function(){
        $('.formOverlay.client').show('600');
    });
    $('body').on('click', '.case-btn', function(){
        $('.formOverlay.case').show('600');
        return false;
    });

    $('input.hasDatetimePicker').datepicker({
        dateFormat: "dd/mm/yy",
        beforeShow: function () {
            setTimeout(
                function () {
                    $('#ui-datepicker-div').css("z-index", "3000");
                }, 100
            );
        }
    });

});
