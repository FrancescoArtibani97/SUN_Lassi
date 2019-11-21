// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery3
//= require popper
//= require moment 
//= require fullcalendar
//= require fullcalendar/locale-all
//= require jquery.timepicker.js
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function(){
	eventCalendar();  
	
	$('#scheduleButton').on('click',function() {
		$('#menuWindow').hide();
		$('#scheduleWindow').fadeIn(500);
	});

	$('#closeButton').on('click', function() {
		$('#dayClickWindow').hide(500);
	});
	
	$('#quickNote').on('click', function() {
		var date = new Date();
		
		// Gets day as 1 = Monday, ..., 3 = Wednesday
		var d = date.getUTCDay();
		var h = date.getUTCHours();
		
		var dd = date.getUTCDate();
		var m = date.getUTCMonth();
		var y = date.getUTCFullYear();
		
		// adding +2 to hours for the time zone
		h += 2;
		
		var s = + dd + "-" + m + "-" + y;
		
		$('#quickNote').attr("href","/homepage/quickNotes?day=" + d + "&hour=" + h + "&date=" + s);
	});
});

$(document).on('turbolinks:before-cache', clearCalendar);

$(document).ready(function () {

	$(".alert").delay(1000).fadeOut(1500, function () {
		$(this).alert('close');
	});
  
	$('.dropdown-toggle').dropdown()


	$('#backButton').on('click', function () {
		$('#menuWindow').fadeIn(500);
		$('#scheduleWindow').hide();
	})

	$('#closeButton').on('click', function () {
		$('#dayClickWindow').hide(500);
	})
});

function eventCalendar() {
	return $('#calendar').fullCalendar({
		locale: 'it',
		height: 'auto',
		selectable: true,
		dayClick: function (date, event, view) {
			date.locale('it');
			$('#dayClickWindow').show(500);
			$('.contentsWindow h3').html(date.format('DD MMMM YYYY').toUpperCase()); 
			$('#scheduleButton').attr("href","/homepage/getLesson?day=" + date.format('dddd') +"&date=" + date.format("MM-DD-YY"));
		},
		unselectCancel: 'html',
		unselect: function (date, event, view) {
			$('#dayClickWindow').hide(300);
			$('#scheduleWindow').hide();
			$('#menuWindow').show();
		}
	});
};

function clearCalendar() {
	$('#calendar').fullCalendar('delete');
	$('#calendar').html('');
};
