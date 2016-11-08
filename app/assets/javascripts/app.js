/**
 * Created by sive on 11/5/16.
 */
$(document).ready(function(){

    

    $('body').on('click', '.user-list li', function(){
        console.log($(this).children().last().val());
    });
});
