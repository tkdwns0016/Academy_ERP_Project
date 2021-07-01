/* global bootstrap: false */
window.addEventListener("DOMContentLoaded",function(){
var i = true;

	function side_slide() {
		if (i) {
			$("section").animate({
				width : '80%'
			}, 500)
			$("nav").animate({
				left : '0%'
			}, 500);
			i = false;
		} else {
			$("section").animate({
				width : '100%'
			}, 500)
			$("nav").animate({
				left : '-20%'
			}, 500);
			i = true;
		}
	}
})
(function () {
  'use strict'
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
  

	function search() {
		document.querySelector(".search_form").submit();
	}
})
