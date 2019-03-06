<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/book.css?abc" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->  
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js"></script>

<script>
 var availableDates = [
	<c:forEach items="${list }" var="performanceVO">
		'<fmt:formatDate value="${performanceVO.showStartdate }" pattern="yyyy-MM-dd"/>',   
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
  
<p><img src="displayFile?filename=${vo.showImagePath }"></p>  
<h4>${vo }</h4>         
<!-- 공연안내  -->
<div class="container-fluid bookWrapper">
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
			<div class="col-md-9">
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
				<div class='PerfInfoWrapper'>testtest</div> 
				       
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
	
			<div class="col-md-3">     
				<!-- 선택한 정보 나오는 곳 -->
				<div class='selectPerfWrapper'>
					내용.....어쩌고.....저쩌고........
				</div>
			</div> 
			                      
		</div>             
	</div>
</div>










<%@ include file="../include/footer.jsp"%>