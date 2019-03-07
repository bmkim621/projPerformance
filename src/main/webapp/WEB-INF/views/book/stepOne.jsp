<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?s" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->  
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js?bbb"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>  
 var availableDates = [
	<c:forEach items="${list }" var="vo">        
		'<fmt:formatDate value="${vo.showStartdate }" pattern="yyyy-MM-dd"/>',   
	</c:forEach>
];   
</script>
  
<div class="container-fluid bookContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">공연정보</p>
				<p class="engHeadline">Performance Guide</p>
			</div>
			<!-- headline end -->
		</div>                                                  
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->           
</div>
<!-- container end -->



<!-- 공연안내  -->
<div class="container bookWrapper">
	<!-- 진행 단계 선택 -->
	<div class="book-progress-wrapper">
		<ul>
			<li class='selectStyle'><a href="#"><span class='spanStep'>01</span>&nbsp;&nbsp;관람일/회차선택</a></li>
			<li><a href="#"><span class='spanStep'>02</span>&nbsp;&nbsp;좌석선택</a></li>
			<li><a href="#"><span class='spanStep'>03</span>&nbsp;&nbsp;가격/할인선택</a></li>
			<li><a href="#"><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</a></li>
			<li><a href="#"><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</a></li>
		</ul>
	</div>                                             
	
	<div class='book-step-wrapper'>
		<div class="row">          
			<div class="col-md-8">
				<div class='datepickerWrapper'>
					<h4>관람일 선택</h4>                     
					<!-- 달력 데이트 피커-->                     
					<div id="datepicker" class="calendar"></div>   
					<!-- 선택여부 -->            
					<ul class='selectDate'>
						<li><div class='spanActiveDate'></div><span class='spanTitle'>공연일</span></li>
						<li><div class='spanActiveSelect'></div><span class='spanTitle'>선택</span></li>  
					</ul>
					<!-- 달력에서 날짜 선택한 정보를 저장함. -->     
					<input type="hidden" id="chkBookDate">	
				</div>        
				
				<!-- 정보 -->   
				<div class='PerfInfoWrapper'>
					<div class='timeTitleWrapper'>
						<h4>회차(관람시간)</h4>
						<div class='chkTimeWrapper'>
							<input type='button' value='15:00' class='btnSelectTime btnActive'>  
							<input type='button' value='20:00' class='btnSelectTime'>
						</div>
					</div>
					<div class='seatTitleWrapper'>
						<h4>좌석등급/잔여석</h4>
						<div class='chkSeatWrapper'>
							
						
						</div>
					</div>
				</div> 
				                                
				<!-- 유의사항 -->
				<div class='bookNoticeWrapper'>
					<span id='spanNoticeTitle'>유의사항</span>                   
					<ul class='ulNotice'>
						<li>- 할인은 자동선택 되지 않으니, <span class='spanUnderline'>적용 받고자 하는 할인이 있는 경우 직접 선택해주시기 바랍니다.</span></li>
						<li>- 장애인, 국가유공자, 학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, <span class='spanUnderline'>현장에서 증빙서류 미지참 시 차액 지불</span>하셔야 합니다.</li>
						<li>- <span class='spanUnderline'>쿠폰을 사용하거나 복합결제를 한 경우 부분취소가 불가</span>합니다. 고객센터로 문의해주시기 바랍니다.</li>
						<li>- <span class='spanUnderline'>관람 당일 공연 예매 시에는 변경/취소/환불이 불가</span>합니다.</li>
						<li>- 경우에 따라 ATM 기기에서 가상계좌입금이 안 될 수 있으니 가급적 인터넷/폰뱅킹 등을 이용해주시기 바랍니다.</li>
						<li>- 예매 취소 시 <span class='spanUnderline'>예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</span></li>
						<li>- 예매 취소 시점에 따라 취소수수료가 부과될 수 있습니다. 예매 후 취소마감시간과 함께 취소 수수료를 꼭 확인해주시기 바랍니다.</li>
					</ul>
				</div> 
				            
			</div>               
	  
			<div class="col-md-4">     
				<!-- 선택한 정보 나오는 곳 -->
				<div class='selectPerfWrapper'>
					<div class='chkImgContainer'>
						<!-- 공연사진 -->
						<img src="displayFile?filename=${vo.showImagePath }">
						<div class='perf-contents-wrapper'>
							<span class='perfTitleSpan'>${vo.showName }</span>
							<span class='perfDateSpan'><fmt:formatDate value="${vo.showStartdate }" pattern="yyyy. MM. dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${vo.showEnddate }" pattern="yyyy. MM. dd"/></span>
							<!-- 공연장소 -->
							<c:if test="${vo.fno.facilitiesNo == 1 }"><span class='perfPlaceSpan'>대구오페라하우스 본관</span></c:if>
							<c:if test="${vo.fno.facilitiesNo == 2 }"><span class='perfPlaceSpan'>별관 카메라타</span></c:if>
							<!-- 공연총시간 -->
							<c:if test="${vo.totalTime == 0 }"><span class='perfTimeSpan'>공연시간 : 미정</span></c:if>
							<span class='perfTimeSpan'>공연시간 : <c:if test="${vo.totalTime != 0 }">${vo.totalTime }</c:if>분</span>
						</div>		  
					</div>  <!-- chkImgContainer end -->
					
					<div class='chkMyContainer'>  
						<h4><i class="fas fa-calendar-check"></i>선택내역</h4>
						<div class='choice-info-wrapper'>         
							<p class='myTitle'>예매일시<span class='info-contents-span' id="book-date-span"></span></p>         
							<p class='myTitle'>예매시간<span class='info-contents-span' id="book-time-span"></span></p>
							<p class='myTitle'>좌석<span class='info-contents-span' id="book-seat-span"></span></p>           		
						</div>       
					</div>
					
					<div class='chkPaymentContainer'>            
						<h4><i class="far fa-credit-card"></i>결제내역</h4>
						<div class='payment-info-wrapper'>
							<p class='myTitle'>티켓금액<span class='info-contents-span' id="book-price-span"></span></p>
							<p class='myTitle'>예매수수료<span class='info-contents-span' id="book-fee-span"></span></p>
							<p class='myTitle'>배송료<span class='info-contents-span' id="book-delivery-span"></span></p>
						    <p class='myTitle'>할인금액<span class='info-contents-span' id="book-discount-span"></span></p>
						</div>    
					</div>
					
					<div class='chkMyStepContainer'>
						<span class='spanTotalPrice'>
							<span class='spanTotalPriceTitle'>최종 결제금액</span>
							<span class='spanPerfTotalPrice'>&nbsp;</span><span class='spanWon'>원</span>
						</span>
						<button id="btnNextStep">다음단계</button>           
					</div>            
				</div>           
			</div>                 
	  		                              
		</div>             
	</div>
</div>        

<!-- 템플릿 -->  
<script id="template" type="text/x-handlebars-template">
<div class='temptemp'>
{{#each.}}
<input type='button' value='{{temptime startTime}}' class='btntest'>   
{{/each}}
</div>
<div class='temp1'>
회차를 선택해주세요.
</div>                                  
</script>

<!-- 템플릿2 -->
<script id="template2" type="text/x-handlebars-template">
{{#each.}}
<input type='button' value='{{seatCategory}}'>           
{{/each}}                               
</script>            

<!-- 시간 헬퍼 -->
<script>
Handlebars.registerHelper("temptime", function(value){
	var date = new Date(value);
	var hour = date.getHours();
	var minutes = date.getMinutes();
	
	if(minutes < 10){
		minutes = "0" + minutes;
	}
	
	return hour + ":" + minutes;      
})
</script>


<%@ include file="../include/footer.jsp"%>