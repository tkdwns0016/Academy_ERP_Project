/* global bootstrap: false */
window.addEventListener("DOMContentLoaded",function(){
var i = true;

	$(".slide")[0].onclick=function() {
	console.log("test2");
		if (i) {
			$("nav").animate({
				left : '0%'
			}, 500);
			i = false;
		} else {
			$("nav").animate({
				left : '-20%'
			}, 500);
			i = true;
		}
	};


  'use strict'
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
  

	function search() {
		document.querySelector(".search_form").submit();
	}
})

