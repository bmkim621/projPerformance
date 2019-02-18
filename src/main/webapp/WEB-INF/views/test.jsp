<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 부트스트랩 js보다 먼저 선언되어 있을 것 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

</style>
</head>   
<body>
	<div class="wrapper">
		<input type="text" placeholder="input date" name="datepicker" class="datepicker">
	</div>
	
	<script>
	$( function() {
		$( ".datepicker" ).datepicker(
			$.datepicker.regional['ru'] = {
				closeText: '닫기',
				prevText: '이전달',
				nextText: '다음달',
				currentText: '오늘',
				monthNames: ['1월','2월','3월','4월','5월','6월',
				'7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
				dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
				dayNamesShort: ['일','월','화','수','목','금','토'],
				dayNamesMin: ['일','월','화','수','목','금','토'],
				dateFormat: 'yy-mm-dd',
				firstDay: 0,
				isRTL: false,
				showOtherMonths: true,
				selectOtherMonths: true,
			}
		);
	});
	</script>
</body>
</html>