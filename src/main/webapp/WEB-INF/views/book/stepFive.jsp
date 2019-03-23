<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?abb" rel="stylesheet" type="text/css">
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

<div class="container bookWrapper">
	<!-- 진행 단계 선택 -->
	<div class="book-progress-wrapper">
		<ul>
			<li><span class='spanStep'>01</span>&nbsp;&nbsp;관람일/회차선택</li>
			<li><span class='spanStep'>02</span>&nbsp;&nbsp;좌석선택</li>
			<li><span class='spanStep'>03</span>&nbsp;&nbsp;가격/할인선택</li>
			<li><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</li>
			<li class='selectStyle'><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</li>     
		</ul>         
	</div>
	
	
	<div class='book-step-wrapper'>
		<div class="row">
			<div class="col-md-8">
				<div class='selectPaymentWrapper'>
					<span id='spanSelectPayment'>결제방식</span>
					<ul id='selectPaymentWrapperUl'>
						<c:forEach items="${paymentList }" var="payment">
							<c:if test="${payment.paymentCode eq 'PAY01' }">
								<li>                                 
									<div class="radio">      
										<label><input type="radio" checked="checked" value='${payment.paymentCode }' name='pCode'>
										<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>${payment.paymentName }</label>
									</div>  
								</li>
							</c:if>
							<c:if test="${payment.paymentCode ne 'PAY01' }">
								<li>
									<div class="radio">      
										<label><input type="radio" value='${payment.paymentCode }' name='pCode'>
										<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>${payment.paymentName }</label>
									</div>	
								</li>  
							</c:if>	
						</c:forEach>	
					</ul>              
				</div>
				
				<!-- 결제 유의사항 -->
				<div class='selectPaymentNoticeWrapper'>
					<span id='spanSelectPayment'>결제 시 유의사항</span>
					<ul id='selectPaymentNoticeWrapperUl'>
						<li>- <span class='spanDecoration'>무통장입금 시, 은행에 따라 밤 11시 30분 이후로는 온라인 입금이 제한 될 수 있습니다.</span></li>
						<li>- 휴대폰 결제 시 전체 취소만 가능합니다.</li>
						<li>- 통신사 별로 한도 금액 내에서 최대 20만원까지 결제 가능합니다.</li>
						<li>- 미성년자 명의, 법인 명의, 요금연체, 선불요금제 가입, 사용정지 휴대폰은 휴대폰 결제가 불가능합니다.</li>
					</ul>              
				</div>
				
				<!-- 동의 -->
				<div class='selectPaymentTermsWrapper'>
					<span id='spanSelectPayment'>개인정보 제3자 정보제공</span>
					<div class='terms'>
						<p>(주)인터파크가 제공하는 서비스를 통하여 이용자간 거래관계가 이루어진 경우 고객응대 및 공연정보 안내 등을 위하여 관련한 정보는 필요한 범위내에서 거래 당사자에게 아래와 같이 제공됩니다.</p>
						<p>1. 개인정보 제공 동의<br>인터파크는 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 이용자의 개인정보에 있어 아래와 같이 알리고 동의를 받아 상품의 기획사 및 인터파크 고객센터에 제공합니다.</p>
						<p>2. 개인정보 제공받는자<br><span class='textBold'>(재)대구오페라하우스</span></p>
						<p>3. 개인정보 이용 목적<br><span class='textBold'>기획사 : 티켓 현장발권, 캐스팅 변경, 공연취소 등에 대한 고객 안내</span></p>
						<p>4. 개인정보 제공 항목<br><span class='textBold'>성명, 아이디, 연락처, 이메일주소, 주문/배송 정보</span></p>
						<p>5. 개인정보 보유 및 이용 기간<br><span class='textBold'>개인정보 이용목적 달성 시까지(단, 관계 법령의 규정에 의해 보존의 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유기간까지</span></p>
					</div>
					<div id='allowWrapper'>
						<div class="checkbox">
		        			<label><input type="checkbox" id="chkAllow" name="chkAllow"><span class="cr"><i class="cr-icon fa fa-check"></i></span>제3자 정보제공 내용에 동의합니다.</label>
	       				</div>
	       			</div>             
				</div>
			
			
			
			</div> <!-- col-md-8 end -->
			
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
								<p class='myTitle'>좌석<span class='info-contents-span' id="book-seat-span"><c:forEach items="${bvo }" var="bvo"><c:if test="${bvo.seatGrade eq 'N' }"><span class='mySelectSeatInfo'>전석 ${bvo.bookZone }구역 ${bvo.bookNum }번</span></c:if><c:if test="${bvo.seatGrade ne 'N' }"><span class='mySelectSeatInfo'>${bvo.seatGrade }석 ${bvo.bookZone }구역 ${bvo.bookNum }번</span></c:if></c:forEach></span></p>	           		
							</div>       
					</div>
				                          	
					<div class='chkPaymentContainer'>            
						<h4><i class="far fa-credit-card"></i>결제내역</h4>
						<div class='payment-info-wrapper'>
							<p class='myTitle'>티켓금액<span class='info-contents-span' id="book-price-span">    
								<span class='ticketPriceSpan'><fmt:formatNumber value='${priceInfoMap.ticketPrice }' pattern="#,###"/></span>원</span>   
							</p>
							<p class='myTitle'>예매수수료<span class='info-contents-span' id="book-fee-span">
							<span class='ticketFeeSpan'><fmt:formatNumber value='${priceInfoMap.ticketFee }' pattern="#,###"/></span>원</span>
							</p>  
							<p class='myTitle'>배송료<span class='info-contents-span' id="book-delivery-span">
							<span class='ticketDeliveryFeeSpan'>${priceInfoMap.deliveryFee }</span>원</span></p>   
						    <p class='myTitle'>할인금액<span class='info-contents-span' id="book-discount-span">  
						    <span class='ticketDiscountSpan'><fmt:formatNumber value='${priceInfoMap.ticketDiscount }' pattern="#,###"/></span>원</span></p>
						</div>    
					</div>          
				
					<div class='chkMyStepContainer'>
						<span class='spanTotalPrice'>
							<span class='spanTotalPriceTitle'>최종 결제금액</span>
							<span class='spanPerfTotalPrice'><fmt:formatNumber value='${priceInfoMap.totalPrice }' pattern="#,###"/></span>원
						</span>         
						<button id="btnBook" type="button">결제완료</button>           
					</div>  

				</div>	<!-- selectPerfWrapper end -->         
			
			</div> <!-- col-md-4 end -->
			
			
		</div>	<!-- row end -->
	
	</div>	<!-- book-step-wrapper end -->



</div>	<!-- bookWrapper end -->



<script>
	$(function(){
		$("#btnBook").click(function(){
			//결제방식 코드
			var pCode = $("input[name='pCode']:checked").val();    
//			alert(pCode);  

			if($('input:checkbox[name="chkAllow"]').is(":checked") ==  true){
				$.ajax({
					url: "${pageContext.request.contextPath}/book/insertBook",
					type: "POST",
					data : {pCode: pCode},
					success: function(data){
//						console.log(data);  
						if(data == "insert"){
//							console.log("예매완료");
							location.href = "${pageContext.request.contextPath}/book/result";
						}
					}	                   
				})	//ajax end 	
			} else{
				swal({
					  text: "제 3자 정보 제공 내용을 확인하신 후 동의하기를 체크해주세요.",
					  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
					  button: "확인",
					}); 
			}
	 
		})
	})
</script>

<%@ include file="../include/footer.jsp"%>