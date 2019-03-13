<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?b" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->  
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- alert plugin -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js?a"></script>

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
				<div class='selectDiscountWrapper'>
					<span id='spanSelectDiscount'>할인선택</span>
					<ul id='selectDiscountWrapperUl'>
						<c:forEach items="${discountList }" var="discount">
							<c:if test="${discount.discountCode eq '00' }">
								<li>
									<div class="radio">      
										<label><input type="radio" checked="checked" value='${discount.discountRate }' data-discountCode ='${discount.discountCode }' name='dCode'>
										<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>${discount.discountName } </label>
									</div>
								</li>
							</c:if>          
							
							<c:if test="${discount.discountCode ne '00' }">
								<li>
									<div class="radio">      
										<label><input type="radio" value='${discount.discountRate }' data-discountCode ='${discount.discountCode }' name='dCode'>
										<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>${discount.discountName } ${discount.discountRate }% 할인</label>
									</div>
								</li>
							</c:if>
							
						</c:forEach>	
					</ul>              
				</div>       
				
				<div class='DiscountNoticeWrapper'>
					<span id='spanNoticeDiscount'>입장권 수령 안내</span>
					<ul id='spanNoticeDiscountUl'>
						<li><span class='spanBold'>- 공연 당일 수령</span>: 공연시작 1시간 30분 전부터 1층 매표소에서 수령하실 수 있습니다.</li>
						<li><span class='spanBold'>- 공연일 이전 수령</span>: 대구오페라하우스 별관(카메라타)에서 수령하실 수 있습니다. (단, 오페라하우스 기획공연으로 전화예매 티켓에 한함)</li>
						<li>- 입장권 분실 및 파손 시 <span class='spanUnderline'>재발급이 되지 않으니</span> 보관에 유의하여 주십시오.</li>
					</ul>
				</div>
				
				<div class='divNoticeWrapper'>       
					<span id='spanNoticeTitle'>유의사항</span>
					<ul id='spanNoticeTitleUl'>
						<li>- 할인은 자동선택 되지 않으니, <span class='spanUnderline'>적용 받고자 하는 할인이 있는 경우 직접 선택해주시기 바랍니다.</span></li>
						<li>- 장애인, 국가유공자, 학생 할인 등 증빙서류가 필요한 경우 현장수령만 가능하며, <span class='spanUnderline'>현장에서 증빙서류 미지참 시 차액 지불</span>하셔야 합니다.</li>
						<li>- <span class='spanUnderline'>쿠폰을 사용하거나 복합결제를 한 경우 부분취소가 불가</span>합니다. 고객센터로 문의해주시기 바랍니다.</li>
						<li>- <span class='spanUnderline'>관람 당일 공연 예매 시에는 변경/취소/환불이 불가</span>합니다.</li>
					</ul>
				</div>
                               
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
								<span class='ticketPriceSpan'><fmt:formatNumber value='${total }' pattern="#,###"/></span>원</span>   
							</p>
							<p class='myTitle'>예매수수료<span class='info-contents-span' id="book-fee-span">
							<span class='ticketFeeSpan'><fmt:formatNumber value='${tax }' pattern="#,###"/></span>원</span>
							</p>  
							<p class='myTitle'>배송료<span class='info-contents-span' id="book-delivery-span"></span></p>
						    <p class='myTitle'>할인금액<span class='info-contents-span' id="book-discount-span">
						    <span class='ticketDiscountSpan'>0</span>원</span></p>
						</div>    
					</div>
				
					<div class='chkMyStepContainer'>
						<span class='spanTotalPrice'>
							<span class='spanTotalPriceTitle'>최종 결제금액</span>
							<span class='spanPerfTotalPrice'>&nbsp;</span>원
						</span>
						<button id="btnNextStep" type="button">다음단계</button>           
					</div>  

				</div>	<!-- selectPerfWrapper end -->         
			</div>                
	         
		</div>
	</div>
	
</div>  

<script>
	//1000단위 콤마 붙이기
	function AddComma(data_value) {
		return Number(data_value).toLocaleString('en').split(".")[0];
	}
	
	//값 더하기
	function getTotalPrice(price, fee, discount){
		var sum = parseInt(price) + parseInt(fee) - parseInt(discount);
		$(".spanPerfTotalPrice").html(AddComma(sum));
	}

	$(function() {	             
		
		//화면 바로 실행될 때 나오는 최종 결제금액
		var price = "";
		var priceArray = $(".ticketPriceSpan").html().split(",");
			for (var i = 0; i < priceArray.length; i++) {
				price += priceArray[i];
			}
			
		var fee = "";
		var feeArray = $(".ticketFeeSpan").html().split(",");
			for(var j = 0 ; j < feeArray.length ; j++){
				fee += feeArray[j];
			}
		getTotalPrice(price, fee, 0);
		
		//할인 선택할 때
		$("input[name='dCode']").on('click', function() {
			var selectDiscount = $("input[name='dCode']:checked").val();
//			console.log(selectDiscount);

			//할인코드
			var selectDiscountCode = $(this).attr('data-discountCode');
//			console.log(selectDiscountCode);
			
			//티켓금액         
			var price = "";
			var priceArray = $(".ticketPriceSpan").html().split(",");
			for (var i = 0; i < priceArray.length; i++) {
				price += priceArray[i];
			}
//			console.log(price);

			discountPrice = price * (selectDiscount / 100);   
//			console.log(discountPrice);      
			$(".ticketDiscountSpan").html(AddComma(discountPrice));
			
			//최종 결제 금액
			//1. 티켓금액
			var price = "";
			var priceArray = $(".ticketPriceSpan").html().split(",");
				for (var i = 0; i < priceArray.length; i++) {
					price += priceArray[i];
				}
//			console.log(price);
			
			//2. 예매 수수료
			var fee = "";
			var feeArray = $(".ticketFeeSpan").html().split(",");
				for(var j = 0 ; j < feeArray.length ; j++){
					fee += feeArray[j];
				}
//			console.log(fee);   

			getTotalPrice(price, fee, discountPrice);

		})
		
		
		//다음단계 버튼
		$("#btnNextStep").click(function(){
			//티켓금액
			//1. 티켓금액
			var price = "";
			var priceArray = $(".ticketPriceSpan").html().split(",");
				for (var i = 0; i < priceArray.length; i++) {
					price += priceArray[i];
				}
			
			//2. 예매 수수료
			var fee = "";
			var feeArray = $(".ticketFeeSpan").html().split(",");
				for(var j = 0 ; j < feeArray.length ; j++){
					fee += feeArray[j];
				}
			
			//3. 할인금액
			var discount = "";
			var discountArray = $(".ticketDiscountSpan").html().split(",");
				for(var k = 0 ; k < discountArray.length ; k++){
					discount += discountArray[k];
				}
			
			//4. 최종 결제 금액
			var totalTicketPrice = "";
			var totalTicketPriceArray = $(".spanPerfTotalPrice").html().split(",");
			for(var l = 0 ; l < totalTicketPriceArray.length ; l++){
				totalTicketPrice += totalTicketPriceArray[l];
			}

			//할인코드
			var dCode = $("input[name='dCode']:checked").attr('data-discountCode');    
//			alert(dCode);
			
			location.href = "${pageContext.request.contextPath}/book/stepFour?p=" + price + "&f=" + fee + "&d=" + discount + "&t=" + totalTicketPrice + "&dCode=" + dCode;
		})
		
	})
</script>

			 			 	
						 	
<%@ include file="../include/footer.jsp"%>