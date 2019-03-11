<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?bab" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->  
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- alert plugin -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js?a"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


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
			<li><span class='spanStep'>01</span>&nbsp;&nbsp;관람일/회차선택</li>
			<li><span class='spanStep'>02</span>&nbsp;&nbsp;좌석선택</li>
			<li class='selectStyle'><span class='spanStep'>03</span>&nbsp;&nbsp;가격/할인선택</li>
			<li><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</li>
			<li><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</li>     
		</ul>         
	</div>                                             
	
	<div class='book-step-wrapper'>
		<div class="row">          
			<div class="col-md-8">
				

          	<p>${bvo }</p>      
	  
			<p>${pvo }</p>
	  		                              
			</div>    
			
			
			<div class="col-md-4">     
				<!-- 선택한 정보 나오는 곳 -->
				<div class='selectPerfWrapper'>
				
					<div class='chkImgContainer'>
							<!-- 공연사진 -->
							<img src="displayFile?filename=${pvo.showImagePath }">
							<div class='perf-contents-wrapper'>
								<span class='perfTitleSpan'>${pvo.showName }</span>
								<span class='perfDateSpan'><fmt:formatDate value="${pvo.showStartdate }" pattern="yyyy. MM. dd"/>&nbsp;~&nbsp;<fmt:formatDate value="${pvo.showEnddate }" pattern="yyyy. MM. dd"/></span>
								<!-- 공연장소 -->
								<c:if test="${pvo.fno.facilitiesNo == 1 }"><span class='perfPlaceSpan'>대구오페라하우스 본관</span></c:if>
								<c:if test="${pvo.fno.facilitiesNo == 2 }"><span class='perfPlaceSpan'>별관 카메라타</span></c:if>
								<!-- 공연총시간 -->
								<c:if test="${pvo.totalTime == 0 }"><span class='perfTimeSpan'>공연시간 : 미정</span></c:if>
								<span class='perfTimeSpan'>공연시간 : <c:if test="${pvo.totalTime != 0 }">${pvo.totalTime }</c:if>분</span>
							</div>		  
						</div>  <!-- chkImgContainer end -->
					
					<div class='chkMyContainer'>  
							<h4><i class="fas fa-calendar-check"></i>선택내역</h4>
							<div class='choice-info-wrapper'>         
								<p class='myTitle'>예매일시<span class='info-contents-span' id="book-date-span"><fmt:formatDate value="${bvo[0].bookDate }" pattern="yyyy. MM. dd (E)"/></span></p>         
								<p class='myTitle'>예매시간<span class='info-contents-span' id="book-time-span"><fmt:formatDate value="${bvo[0].bookTime }" pattern="HH시 mm분"/></span></p>
								<p class='myTitle'>좌석<span class='info-contents-span' id="book-seat-span"><c:forEach items="${bvo }" var="bvo"><c:if test="${bvo.seatGrade == null }"><span class='mySelectSeatInfo'>전석 ${bvo.bookZone }구역 ${bvo.bookNum }번</span></c:if><c:if test="${bvo.seatGrade != null }"><span class='mySelectSeatInfo'>${bvo.seatGrade }석 ${bvo.bookZone }구역 ${bvo.bookNum }번</span></c:if></c:forEach></span></p>	           		
							</div>       
					</div>
					
					<div class='chkPaymentContainer'>            
						<h4><i class="far fa-credit-card"></i>결제내역</h4>
						<div class='payment-info-wrapper'>
							<p class='myTitle'>티켓금액<span class='info-contents-span' id="book-price-span">
							<c:forEach items="${bvo }" var="bvo">
						 		<c:if test="${bvo.seatGrade eq 'R'}"><span class='ticketPriceSpan'>100000</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'S'}"><span class='ticketPriceSpan'>80000</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'A'}"><span class='ticketPriceSpan'>50000</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'B'}"><span class='ticketPriceSpan'>30000</span></c:if>
						 		<c:if test="${bvo.seatGrade == null}"><span class='ticketPriceSpan'>20000</span></c:if>
						 	</c:forEach> 
							</span></p>
							<p class='myTitle'>예매수수료<span class='info-contents-span' id="book-fee-span">
							<c:forEach items="${bvo }" var="bvo">
						 		<c:if test="${bvo.seatGrade eq 'R'}"><span class='ticketFeeSpan'>1000</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'S'}"><span class='ticketFeeSpan'>800</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'A'}"><span class='ticketFeeSpan'>500</span></c:if>
						 		<c:if test="${bvo.seatGrade eq 'B'}"><span class='ticketFeeSpan'>300</span></c:if>
						 		<c:if test="${bvo.seatGrade == null}"><span class='ticketFeeSpan'>200</span></c:if>  
						 	</c:forEach>
							</span></p>
							<p class='myTitle'>배송료<span class='info-contents-span' id="book-delivery-span"></span></p>
						    <p class='myTitle'>할인금액<span class='info-contents-span' id="book-discount-span"></span></p>
						</div>    
					</div>
				
					<div class='chkMyStepContainer'>
						<span class='spanTotalPrice'>
							<span class='spanTotalPriceTitle'>최종 결제금액</span>
							<span class='spanPerfTotalPrice'>&nbsp;</span><span class='spanWon'>원</span>
						</span>
						<button id="btnNextStep" type="button">다음단계</button>           
					</div>  
				
			
			
				
				 
				 
				</div>	<!-- selectPerfWrapper end -->         
			</div>                
			
			
			
			
			
			         
		</div>
	</div> 
</div>

<script>
	$(function(){
		//가격 계산하기
		var p = $("#book-price-span").children(".ticketPriceSpan");
				
		$.each(p, function(i, obj){
			res += $(this).text()
			console.log(res);     
		})      
//		console.log(p);
	})
</script>

<%@ include file="../include/footer.jsp"%>