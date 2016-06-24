<%@ page contentType="text/html; charset=utf-8"%>

<link href='../fullcalendar/fullcalendar.css' rel='stylesheet' />
<link href='../fullcalendar/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<script src='../fullcalendar/lib/moment.min.js'></script>
<script src='../fullcalendar/lib/jquery.min.js'></script>
<script src='../fullcalendar/fullcalendar.min.js'></script>
<script>

$(document).ready(function() {
	
	$('#calendar').fullCalendar({

		editable: false,
		eventLimit: true,
	    eventSources: 
	    [
	       {
	            url: '/front?cmd=CALENDAR_DATA_MAIN',
	            type: 'POST',
	            error: function() {
	                alert('there was an error while fetching events!');
	            },
	            color: 'yellow',   // a non-ajax option
	            textColor: 'black' // a non-ajax option
	        }
	    ]

	});
});
</script>
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>



<div id='calendar'></div>

