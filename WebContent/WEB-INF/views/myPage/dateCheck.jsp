<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
#startDate1 {
	border: 1px solid #A4A4A4;
	border-radius: 3px;
	padding: 3px 3px;
	font-size: 1em;
	width: 100px;
	autocomplete
	=
	off;
}

#endDate1 {
	border: 1px solid #A4A4A4;
	border-radius: 3px;
	padding: 3px 3px;
	font-size: 1em;
	width: 100px;
	autocomplete
	=
}
</style>
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $("#startDate1" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate1").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate1" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate1").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>
</head>
<body>
	<div class="date_check_calendar">
		<form method="get" name="frmDateSearch" class="order_form"
			autocomplete="off">
			<table class="ship_table">
				<tr>
					<td id="ship_search" width=50px; height=30px><button
							type="button" class="ship_button">오늘</button></td>
					<td id="ship_search" width=50px; height=30px;><button
							type="button" class="ship_button">7일</button></td>
					<td id="ship_search" width=50px; height=30px;><button
							type="button" class="ship_button">15일</button></td>
					<td id="ship_search" width=50px; height=30px;><button
							type="button" class="ship_button">1개월</button></td>
					<td id="ship_search" width=50px; height=30px><button
							type="button" class="ship_button">3개월</button></td>
					<td id="ship_search" width=50px; height=30px><button
							type="button" class="ship_button">1년</button></td>
					<td id="ship_search" width=50px; height=30px><button
							type="button" class="ship_button">3년</button></td>
					<td id="order_search" width=15px; height=30px></td>
					<td id="order_search"><input type="text" id="startDate1"
						style="font-size: small" autocomplete='off' /></td>
					<td id="order_search" width=5px; height=30px
						style="font-size: small">~</td>
					<td id="order_search" width=20px; height=30px><input
						type="text" id="endDate1" style="font-size: small"
						autocomplete='off' /></td>
					<td><button type="submit" class="btn_date_check">조회</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>