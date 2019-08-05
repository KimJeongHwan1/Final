<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
</style>
<link href="/resources/fullcalendar/fullcalendar.css" rel="stylesheet"/>
<link href="/resources/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="/resources/fullcalendar/lib/moment.min.js"></script>
<script type="text/javascript" src="/resources/fullcalendar/lib/jquery.min.js"></script>
<script type="text/javascript" src="/resources/fullcalendar/fullcalendar.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
    	
    	var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
    	
    	
    	
    	
        jQuery("#calendar").fullCalendar({
        	header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
        	
        	defaultDate : "2019-07-01"
            , 
            selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				
				var title = prompt('일정을 입력하세요.');
				if (title) {
				
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
				
			},
            
            
            
            editable : true
            , eventLimit : true
            , events: [
                {
                      title : "All Day Event"
                    , start : "2019-07-01"
                },
                {
                      title : "Long Event"
                    , start : "2019-07-01"
                    , end : "2019-07-03"
                },
               
                                
                {
                      title : "Lunch"
                    , start : "2019-06-17T12:00:00"
                },
                
                {
                      title : "Happy Hour"
                    , start : "2019-07-12T17:30:00"
                },
                
                
                {
                      title : "Click for Google"
                    , url : "http://google.com/"
                    , start : "2019-07-28"
                },
              
                {
					title: '01 All Day Event',
					start: new Date(y, m, 1)
				}
               
            ]
        });
    });
    
    
    
</script>
<body>
    
    <div id="calendar"></div>




<c:import url="/WEB-INF/views/layout/footer.jsp" />