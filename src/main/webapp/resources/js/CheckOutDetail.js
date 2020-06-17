const contextRoot = "/" + window.location.pathname.split( '/' )[1];

$(function(){
	$(window).on('load', function () {
      $.get(`${contextRoot}/payment`,function(data,status){
		 
	  })
 });

})

