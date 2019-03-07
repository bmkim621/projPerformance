$(function(){
	
	//특정일 활성화
	function available(date) {
		var thismonth = date.getMonth() + 1;	//월
		var thisday = date.getDate();			//일
		
		if (thismonth < 10) {
			thismonth = "0" + thismonth;	//1~9월은 앞에 0이 붙도록 함. 01, 02, .. 09월
		}
		if (thisday < 10) {					//1~9일은 앞에 9이 붙도록 함. 01, 02, .. 09일
			thisday = "0" + thisday;
		}

		ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;	// 년-월-일

		if ($.inArray(ymd, availableDates) >= 0) {
			return [ true, "ui-state-active", "" ];	//availableDates에 해당하는 날만 활성화(true)하고, 클래스 이름(ui-state-active)을 추가한다.
		} else {
			return [ false, "my-ui-state-inactive", "" ];	//availableDates에 해당하는 날에 비활성화(false)하고, 클래스 이름을 추가한다.
		}
		console.log(availableDates);
	}    
	
	//날짜선택
	function selectBookDate(date){
//		alert("test");     
//		console.log(date);
		var showName = $(".perfTitleSpan").text();   
		console.log(showName);
		
		var bookDate = $("#book-date-span").text();
		console.log(bookDate);
		
		var bookTime = $("#book-time-span").text();
		console.log(bookTime);
		
		$.ajax({
			
			url: contextPath + "/book/search",  
			type: "GET",
			data:{showName:showName, bookDate: bookDate, bookTime: bookTime },
			dataType: "json",              
			success: function(json){
				             
				console.log(json);
				  
				$(".chkTimeWrapper").empty();  
				
				var source = $("#template").html();
				var f = Handlebars.compile(source);   
				var result = f(json);    
				$(".chkTimeWrapper").append(result);
				
			}
		})	//ajax end		
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
			showOtherMonths : false,  
			selectOtherMonths : true,	
			showMonthAfterYear : true,
			yearSuffix : '년',
			onSelect: function(dateText, inst) {	//날짜 선택했을 때
				var date = $(this).val();
//				console.log(date);         	                                     
//		        alert('선택하신 날짜는 '+date);
		        $("#book-date-span").text(date);	//값 넣음.
		        selectBookDate(date);
		                        	
		    }                                          
		});
	
	
	//회차(시간) 선택했을 때 => 동적으로 추가했기 때문에 document.on(~~) 사용해야 함.
	$(document).on("click", ".btnSelectTime", function(){
		var res = $(this).val(); //값
		
		$(this).addClass("btnActive");   //시간 선택하면 버튼 색깔 바뀌도록 클래스 추가  
//		console.log(res);
		$("#book-time-span").html(res);
		
		var showName = $(".perfTitleSpan").text();   
		var bookDate = $("#book-date-span").text();
		var bookTime = $("#book-time-span").text();  

		$.ajax({
			url : contextPath + "/book/search",
			type : "GET",
			data : {showName : showName, bookDate : bookDate, bookTime : bookTime},
			dataType : "json",
			success : function(json) {

				console.log(json);
				
				$(".chkSeatWrapper").empty();

				var source = $("#template2").html();
				var f = Handlebars.compile(source);  
				var result = f(json);
				$(".chkSeatWrapper").append(result);            
			}
		}) // ajax end
		
	})            
	
	
     
})        