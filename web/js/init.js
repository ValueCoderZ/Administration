(function($){
  $(function(){
	$('.button-collapse').sideNav({
      menuWidth: 300, // Default is 300
      edge: 'left', // Choose the horizontal origin
      closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
      draggable: true, // Choose whether you can drag to open on touch screens,
    }
    );
    $('.parallax').parallax();
    $('.modal').modal();
    $('.scrollspy').scrollSpy();
    $('.collapsible').collapsible();
    $(".dropdown-button").dropdown();
    $('ul.tabs').tabs();    
    $('select').material_select();
  }); // end of document ready
})(jQuery); // end of jQuery name space