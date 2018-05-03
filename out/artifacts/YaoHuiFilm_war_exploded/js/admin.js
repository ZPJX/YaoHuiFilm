$(function(){
    //toggle li
    $('#sidebar-list>li').click(function () {
      $('#sidebar-list>li.active').removeClass("active");
      $(this).addClass("active");
    })
    
    
    var calcContainerHeight = function() {
        var headerDimensions = $('#header').height();
        $('#container').height($(window).height() - headerDimensions);
        $('#content').height($(window).height() - headerDimensions);
        $('#right-frame').height($(window).height() - headerDimensions - 5);
    }
    
    $(document).ready(function() {
    
    // Run functions on window load, and resize
    
        $(window).resize(function() {
            calcContainerHeight();
        }).load(function() {
            calcContainerHeight();
        });
    });
})