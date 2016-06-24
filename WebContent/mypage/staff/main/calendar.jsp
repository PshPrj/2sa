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
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: false,
		eventLimit: true,
	    eventSources: [

	        // your event source
	        {
	            url: '../calendar?cmd=CALENDAR_DATA',
	            type: 'POST',
	            error: function() {
	                alert('there was an error while fetching events!');
	            },
	            color: 'yellow',   // a non-ajax option
	            textColor: 'black' // a non-ajax option
	        }
	    ], eventClick: function(event) {
	        if (event.url) {
	            window.open(event.url,'window','status=no,menubar=no,scrollbars=no,resizable=no,width=450,height=500');
	            return false;
	        }
	    }

	});
});
</script>
<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>

<h4 align="left">예약 확인</h4>
<p class="text-info" align="left">결제 완료 목록만 보여집니다.(예약 시간 기본 3시간)</p>
<p class="text-info" align="left">예약 내역을 누르면 정보를 수정 할 수 있습니다.</p>
<hr />

<div id='calendar'></div>

