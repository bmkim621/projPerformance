$(function(){
	var availableDates = ["2019-03-10", "2019-03-11"];

	function available(date) {

		var thismonth = date.getMonth() + 1;

		var thisday = date.getDate();

		if (thismonth < 10) {

			thismonth = "0" + thismonth;

		}

		if (thisday < 10) {

			thisday = "0" + thisday;

		}

		ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;

		if ($.inArray(ymd, availableDates) >= 0) {

			return [ true, "ui-state-active", "" ];

		} else {

			return [ false, "my-ui-state-inactive", "" ];

		}

	}

	// 공연시작일
	$("#datepicker").datepicker(
		$.datepicker.regional['ko'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토'],
			dateFormat : 'yy-mm-dd',
			beforeShowDay: available,	//함수이름  
			firstDay : 0,
			isRTL : false,
			showOtherMonths : true,
			selectOtherMonths : true,
			showMonthAfterYear : true,
			yearSuffix : '년',
			onSelect: function(dateText, inst) {
				var date = $(this).val();
				console.log(date);
				                   
//		        alert('선택하신 날짜는 '+date);
		    }                           
		});
	
	
     
})        