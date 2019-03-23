<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?cc" rel="stylesheet" type="text/css">
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
			<li class='selectStyle'><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</li>
			<li><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</li>     
		</ul>         
	</div>
	           
	
	<div class='book-step-wrapper'>
		<div class="row">
		
			<div class="col-md-8">
				<div class='selectDeliveryWrapper'>  
					<span id='spanSelectDelivery'>티켓수령방법</span>
					<ul id='selectDeliveryWrapperUl'>
						<li>
							<div class="radio">      
								<label><input type="radio" checked="checked" value='0' name='chkDelivery'>
								<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span>현장수령</label>
							</div>
						</li>     
						<li>
							<div class="radio">      
								<label><input type="radio" disabled="disabled" name='chkDelivery'>
								<span class="cr"><i class="cr-icon fas fa-circle" style="color:#e53a40"></i></span> 배송(2,800원)</label>
							</div>
						</li>
						<li>
							<p>※ 티켓현장수령은 예매시 부여되는 <span class='spanDecoration'>"예약번호"로 관람일 당일 티켓을 수령하여 입장합니다.</span>
						</li>	
					</ul>              
				</div>       

				<div class='MyInfoWrapper'>
					<span id='spanNoticeDiscount'>예매자 확인</span>
					<table>
						<tr>
							<td>이름</td>
							<td><input type='text' value='${mvo.memberName }' id='memName'></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type='text' id='memDob'> <span id='spanBirth'>예) 850101 (YYMMDD)</span></td>
						</tr>
						<tr>
							<td colspan="2"><span id='spanInfoNotice'>※ 현장수령 및 고객문의시 본인확인을 위해 정확한 정보를 입력해주세요.</span></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>
								<input type='text' id='firstPhoneNum'>-<input type='text' id='secondPhoneNum'>-<input type='text' id='thirdPhoneNum'>
							</td>
						</tr>
						<tr>  
							<td>이메일</td>
							<td><input type='text' value='${mvo.email }' id='memEmail'></td>
						</tr>
						<tr>
							<td colspan="2"><span id='spanChkNotice'>※ SMS 문자와 이메일로 예매 정보를 보내드립니다.</span>
						</tr>
					</table>
				</div>
				
				<div class='selectDeliveryNoticeWrapper'>
					<span id='spanSelectDelivery'>티켓 현장수령 시 유의사항</span>
					<ul id='selectDeliveryNoticeWrapperUl'>
						<li>
							<p>- <span class='spanDecoration'>티켓현장수령은 예매 시 부여되는 "예약번호(티켓번호)"로 당일 티켓을 수령, 입장하는 것입니다.</span></p>
						</li>
						<li>- 1시간 전 현장에 도착하셔서 티켓을 수령하시면 이용에 불편함이 없으십니다.</li>
						<li>- 티켓 수령 시 예매확인서(또는 예약번호)와 신분증을 지참하셔야 합니다.
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
							<span class='ticketDeliveryFeeSpan'></span>원</span></p>   
						    <p class='myTitle'>할인금액<span class='info-contents-span' id="book-discount-span">  
						    <span class='ticketDiscountSpan'><fmt:formatNumber value='${priceInfoMap.ticketDiscount }' pattern="#,###"/></span>원</span></p>
						</div>    
					</div>          
				
					<div class='chkMyStepContainer'>
						<span class='spanTotalPrice'>
							<span class='spanTotalPriceTitle'>최종 결제금액</span>
							<span class='spanPerfTotalPrice'><fmt:formatNumber value='${priceInfoMap.totalPrice }' pattern="#,###"/></span>원
						</span>         
						<button id="btnNextStep" type="button">다음단계</button>           
					</div>  

				</div>	<!-- selectPerfWrapper end -->         
			
			</div> <!-- col-md-4 end -->
		
		</div>	<!-- row end -->
	</div>
</div>	<!-- bookWrapper end -->





<script>
//유효성 검사
function validate(){
	var vdemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일이 적합한지 검사할 정규식
	var vdname = /^[가-힣]{2,4}$/;
	var vdphone1 = /^[0-9]{3}$/;
	var vdphone2 = /^[0-9]{3,4}$/;
	var vdphone3 = /^[0-9]{4}$/;
	var vddob = /^[0-9]{6}$/;
	
	var name = $("#memName").val();
	var email = $("#memEmail").val();
	var phoneFirst = $("#firstPhoneNum").val();
	var phoneMiddle = $("#secondPhoneNum").val();
	var phoneLast = $("#thirdPhoneNum").val();
	var dob = $("#memDob").val();
	
	
	if(!vddob.test(dob)){
		swal({
			  text: "올바르지 않은 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			});
		$("#memDob").val("");
		$("#memDob").focus();
		
		return false;
	} else if(!vdname.test(name)){
		swal({
			  text: "올바르지 않은 이름 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#memName").val("");
		$("#memName").focus();
		
		return false;
	} else if(!vdemail.test(email)){
		swal({
			  text: "올바르지 않은 이메일 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#memEmail").val("");
		$("#memEmail").focus();
		
		return false;
	} else if(!vdphone1.test(phoneFirst)){
		swal({
			  text: "올바르지 않은 전화번호 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#firstPhoneNum").val("");
		$("#firstPhoneNum").focus();
		
		return false;
	}else if(!vdphone2.test(phoneMiddle)){
		swal({
			  text: "올바르지 않은 전화번호 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#secondPhoneNum").val("");
		$("#secondPhoneNum").focus();
		
		return false;
	} else if(!vdphone3.test(phoneLast)){
		swal({
			  text: "올바르지 않은 전화번호 형식입니다.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#thirdPhoneNum").val("");
		$("#thirdPhoneNum").focus();
		
		return false;
	} else if(name == "") {
		swal({
			  text: "이름을 입력해주세요.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#memName").focus();
         return false;
     } else if(email == "") {
		swal({
			  text: "이메일을 입력해주세요.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#email").focus();
           return false;
       } else if(phoneFirst == "") {
   		swal({
			  text: "연락처를 입력해주세요.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#firstPhoneNum").focus();
         return false;
      } else if(phoneMiddle == "") {
		swal({
			  text: "연락처를 입력해주세요.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#secondPhoneNum").focus();
           return false;
       } else if(phoneLast == "") {
		swal({
			  text: "연락처를 입력해주세요.",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#thirdPhoneNum").focus();
           return false;
       } else if(dob =="") {
		swal({
			  text: "생년월일을 입력해주세요.(YYMMDD)",
			  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  button: "확인",
			}); 
		$("#memDob").focus();
           return false;
       } else{
    	   //5단계로 이동
    	   location.href = "${pageContext.request.contextPath}/book/stepFive";
       }
	}


	$(function(){
		//연락처
		var numPhone = "${mvo.phone }";
		var phoneArray = numPhone.split("-");
//		console.log(numPhone);
		$("#firstPhoneNum").val(phoneArray[0]);
		$("#secondPhoneNum").val(phoneArray[1]);
		$("#thirdPhoneNum").val(phoneArray[2]);
		
		//배송비용
		var deliveryFee = $("input[name='chkDelivery']:checked").val();  
		$(".ticketDeliveryFeeSpan").append(deliveryFee);
		
		//다음단계 버튼
		$("#btnNextStep").click(function(){
			//input 유효성 검사
			validate();
		})
	})
	
</script>



<%@ include file="../include/footer.jsp"%>