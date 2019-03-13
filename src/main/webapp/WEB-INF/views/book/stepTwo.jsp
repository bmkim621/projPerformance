<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?cac" rel="stylesheet" type="text/css">
<!-- datepicker css 사용하기 위해서는 jquery UI 필요 -->  
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<!-- alert plugin -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/book.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<style>
div.seatContainer {             
	display: inline-block;
	width: 22px;
	height: 22px;                        
	border: 1px solid #bebebe;
	background-color: gray;
	margin: 2px;
	font-size: 12px;          
}   
                
div.aWrapper, div.bWrapper, div.cWrapper{    
	display: inline-block;
	width: 157px;                                                                                                
	height: 256px;                                       
	border: 1px solid #f0f0f0;      
	text-align: center;
	padding: 5px;           
	overflow: hidden;     
}

div.bWrapper, div.cWrapper, div.bInfoWrapper, div.cInfoWrapper{
	margin-left: 20px;
}

div.aInfoWrapper, div.bInfoWrapper, div.cInfoWrapper{
	display: inline-block;
	width: 157px;                                                                                                
	height: 30px;                                      
	background: #eaeaea;     
	text-align: center;               
	overflow: hidden;
	margin-top: 10px;        
}
 
span.aInfoTitle{
	color: #666;
	font-size: 13px;      
}
            
div.gradeR{
	background-color: #B5B2FF;
}

div.gradeS{
	background-color: #B2EBF4;
}

div.gradeA{
	background-color: #FFDD73;
}

div.gradeB{
	background-color: #BCE55C;
}

div.booked{
	background-color: #BDBDBD;       
}

div.chkSeat{
	border: 3px solid gray;                   
}        

/* 이미 선택된 좌석 */
.alreadyResvSeat{
	background-color: blue!important;
}

/* 선택한 좌석 span */
span.span-wrapper{
	margin-left: 10px;
}                      

</style>

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
			<li class='selectStyle'><span class='spanStep'>02</span>&nbsp;&nbsp;좌석선택</li>
			<li><span class='spanStep'>03</span>&nbsp;&nbsp;가격/할인선택</li>
			<li><span class='spanStep'>04</span>&nbsp;&nbsp;배송선택/주문자확인</li>
			<li><span class='spanStep'>05</span>&nbsp;&nbsp;결제하기</li>     
		</ul>         
	</div>                                             
	
	<div class='book-step-wrapper'>
		<div class="row">          
			<div class="col-md-12">        
				<div class='seatWrapper'>
					<div class='seat-contents-wrapper'>
						<!-- 좌석분류 : SEAT1 -->
						<c:if test="${list[0].locCode eq 'SEAT1' }">
							<div class='stageWrapper'><span class='spanStageTitle'>STAGE</span></div>
							<div class='aWrapper'>	<!-- A구역 -->
								<c:forEach begin="${list[0].startLoc }" end="${list[0].endLoc }" var="x">
									<div class='seatContainer' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='N'></div>  
									<c:if test="${x % row == 0 }"><br></c:if>  
								</c:forEach>
							</div>
						 
							<div class='bWrapper'>	<!-- B구역 -->
								<c:forEach begin="${list[1].startLoc }" end="${list[0].endLoc }" var="y">
									<div class='seatContainer' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='N'></div>
									<c:if test="${y % row == 0 }"><br></c:if>
								</c:forEach>
							</div>
						
							<div class='cWrapper'>	<!-- C구역 -->
								<c:forEach begin="${list[2].startLoc }" end="${list[0].endLoc }" var="z">
									<div class='seatContainer' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='N'></div>
									<c:if test="${z % row == 0 }"><br></c:if>
								</c:forEach>
							</div> 
						</c:if>
						
						<!-- 좌석분류 : SEAT2 -->
						<c:if test="${list[0].locCode eq 'SEAT2' }">
							<div class='stageWrapper'><span class='spanStageTitle'>STAGE</span></div>
							<!-- A구역 -->
							<div class='aWrapper'>
								<c:forEach begin="${list[0].startLoc }" end="${list[0].endLoc }" var="x">  						
									<!-- R석 -->
									<c:if test="${x <= (row * 2) }">
										<div class='seatContainer gradeR' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='R'></div>							
										<c:if test="${x % row == 0 }"><br></c:if>
									</c:if>
								
									<!-- S석 -->
									<c:if test="${ x >= (row * 2) + list[0].startLoc && x <= (row * 4) }">
										<div class='seatContainer gradeS' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='S'></div>  							
										<c:if test="${x % row == 0 }"><br></c:if>
									</c:if> 
								
									<!-- A석 -->
									<c:if test="${ x >= (row * 4) + list[0].startLoc && x <= (row * 6) }">
										<div class='seatContainer gradeA' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='A'></div>
										<c:if test="${x % row == 0 }"><br></c:if>
									</c:if> 
									
									<!-- B석 -->
									<c:if test="${ x >= (row * 6) + list[0].startLoc && x <= (row * 8) }">
										<div class='seatContainer gradeB' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='B'></div>
										<c:if test="${x % row == 0 }"><br></c:if>
									</c:if>				
								</c:forEach>
							</div>
						
							<!-- B구역 -->
							<div class='bWrapper'>
								<c:forEach begin="${list[1].startLoc }" end="${list[1].endLoc }" var="y">  
									<!-- R석 -->
									<c:if test="${y <= (row * 2) }">
										<div class='seatContainer gradeR' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='R'></div>
										<c:if test="${y % row == 0 }"><br></c:if>
									</c:if>
									
									<!-- S석 -->	
									<c:if test="${ y >= (row * 2) + list[1].startLoc && y <= (row * 4) }">
										<div class='seatContainer gradeS' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='S'></div>  
										<c:if test="${y % row == 0 }"><br></c:if>
									</c:if> 
									
									<!-- B석 -->	
									<c:if test="${ y >= (row * 4) + list[1].startLoc && y <= (row * 6) }">
										<div class='seatContainer gradeA' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='A'></div>
										<c:if test="${y % row == 0 }"><br></c:if>
									</c:if> 
									
									<!-- A석 -->	
									<c:if test="${ y >= (row * 6) + list[1].startLoc && y <= (row * 8) }">
										<div class='seatContainer gradeB' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='B'></div>
										<c:if test="${y % row == 0 }"><br></c:if>
									</c:if>		 	
								</c:forEach>	
							</div>
						
							<!-- C구역 -->
							<div class='cWrapper'>
								<c:forEach begin="${list[2].startLoc }" end="${list[2].endLoc }" var="z">  
									<!-- R석 -->
									<c:if test="${z <= (row * 2) }">
										<div class='seatContainer gradeR' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='R'></div>
										<c:if test="${z % row == 0 }"><br></c:if>
									</c:if>
									
									<!-- S석 -->	
									<c:if test="${ z >= (row * 2) + list[2].startLoc && z <= (row * 4) }">
										<div class='seatContainer gradeS' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='S'></div>  
										<c:if test="${z % row == 0 }"><br></c:if>
									</c:if> 
									
									<!-- A석 -->	
									<c:if test="${ z >= (row * 4) + list[2].startLoc && z <= (row * 6) }">
										<div class='seatContainer gradeA' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='A'></div>
										<c:if test="${z % row == 0 }"><br></c:if>
									</c:if> 
									
									<!-- B석 -->
									<c:if test="${ z >= (row * 6) + list[2].startLoc && z <= (row * 8) }">
										<div class='seatContainer gradeB' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='B'></div>
										<c:if test="${z % row == 0 }"><br></c:if>  
									</c:if>		 	
								</c:forEach>
							</div>
						</c:if>  
						
						<br>
						<div class='aInfoWrapper'><span class='aInfoTitle'>A구역</span></div>
						<div class='bInfoWrapper'><span class='aInfoTitle'>B구역</span></div>
						<div class='cInfoWrapper'><span class='aInfoTitle'>C구역</span></div>
					
					</div>	<!-- seat-contents-wrapper end -->
				</div>	<!-- seatWrapper end -->
				
				<div class='seatNoticeWrapper'>  
					<span id='span-notice-seat'>좌석 선택 시 유의사항</span> 
					<ul id='seat-notice-ul'>
						<li>- 선택한 좌석을 다시 클릭하면 취소됩니다.</li>
						<li>- 좌석 선택 후 결제가 완료되지 않을 경우, 선택하신 좌석의 선점기회를 잃게 됩니다.</li>
					</ul>
				</div>
				
				<!-- 좌석 선택 -->  
				<div class='chkMySeatWrapper'>
						<span id='spanChkSeat'>선택한 좌석</span>   
						<ul id='chkMySeat'></ul>			
				</div>
				
				<div class='chkSeatBtnWrapper'>
					<button type="button" id='goThird'>좌석선택 완료</button>
				</div>
			</div>	<!-- col-md-8 end -->
		</div>	<!-- row end -->
	</div>	<!-- book-step-wrapper end -->
</div>	<!-- bookWrapper end -->				

			
				
			
				    
				  
				
          



<form>
	<input type='hidden' name='showCode' id='twoShowCode' value='${vo.sCode.showCode }'>  
</form>
                    
<script>

	var seat = [<c:forEach items="${reservedSeat }" var="seat">{num:${seat.bookNum}, zone:'${seat.bookZone}'},</c:forEach>];
	  
 	$(function(){
 		$.each(seat, function(i, obj){
//			alert(obj);
			$(".seatContainer[data-seatnum=" + obj.num + "][data-seatzone=" + obj.zone + "]").addClass("booked");     
			
		})	//each end
		
		$(".seatContainer").click(function(){
			var me = $(this);
			var selectSeatNum = $(this).attr('data-seatnum');	//선택한 좌석 번호
			var selectSeatZone = $(this).attr('data-seatzone');	//선택한 좌석 구역
			var selectShowCode = $("#twoShowCode").val();		//공연코드
			var selectSeatGrade = $(this).attr('data-seatgrade');
			
//			console.log(selectSeatNum);
//			console.log(selectSeatZone);
				
			me.addClass("chkSeat");  
//			$(".chkSeat").unbind('click');              
			
			$.ajax({
				url: "${pageContext.request.contextPath}/book/insertTempSeat",
				type: "POST",
				data : {selectShowCode: selectShowCode, selectSeatZone: selectSeatZone, selectSeatNum: selectSeatNum, selectSeatGrade: selectSeatGrade},
				success: function(data){
//					console.log(data);  
					if(data == "success"){
//						alert("완료");
	//					$("#spanSeatZone").html(selectSeatZone + "구역 ");
	//					$("#spanSeatNum").html(selectSeatNum + "번");
						str = "";    
						str += "<li>- <span id='spanSeatZone'>" + selectSeatZone + "구역 </span><span id='spanSeatNum'>" + selectSeatNum + "</span>번</li>";
						$("#chkMySeat").append(str);
					}         
					if(data == "fail"){  
						swal({
			  				  text: "이미 선택된 좌석입니다.",
			  				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
			  				  button: "확인",
			  				});
					
						$("#spanResultInfo").html("");
						me.addClass("alreadyResvSeat");              
					}
					if(data == "modify"){
						me.removeClass("chkSeat");               
						$("#chkMySeat").empty();                    
					}
					    
				}
				            
			})	//ajax end  

		})
		
		//예약된 좌석 클릭 못하게 한다.
		$(".booked").unbind('click');  
 		
 		$("#goThird").click(function(){
 			var seatInfo = $("#chkMySeat").html();
 			console.log(seatInfo);
 			
 			if(seatInfo == ""){
 				swal({
	  				  text: "좌석을 선택해주세요.",
	  				  closeOnClickOutside: false,	//버튼 눌러야만 창 닫도록 함.
	  				  button: "확인",
	  				});
 			} else{
 				location.href = "${pageContext.request.contextPath}/book/stepThree";
 			}
 			
 			
 		})
 		
	})   
</script>


<script>
//브라우저에서 X버튼 누를 시 세션 종료시키도록 한다.
var MouseEventObj = new Object();

function addEvent(obj, evt, fn) {
    if (obj.addEventListener) {
        obj.addEventListener(evt, fn, false);
    }
    else if (obj.attachEvent) {
        obj.attachEvent("on" + evt, fn);
    }
}

addEvent(document, "mouseout", function(e) {
    e = e ? e : window.event;
    var from = e.relatedTarget || e.toElement;
    if(!from) {
        MouseEventObj.clientX = e.clientX;
        MouseEventObj.clientY = e.clientY;
    }
});  

addEvent(document, "mouseover", function(e) {
    e = e ? e : window.event;
    var from = e.relatedTarget || e.toElement;
    if(from) {
        MouseEventObj.clientX = e.clientX;
        MouseEventObj.clientY = e.clientY;
    } 
});

window.onbeforeunload = function(e) {
 e = e ? e : window.event;
 if(e.clientX && e.clientY) {
     MouseEventObj.clientX = e.clientX;
     MouseEventObj.clientY = e.clientY;
 }
 
 if ((MouseEventObj.clientY <0) ||(e.altKey) ||(e.ctrlKey)||((MouseEventObj.clientY < 129) && (MouseEventObj.clientY>107))) { 
  console.log(MouseEventObj);
  $.get( "${pageContext.request.contextPath}/member/logout", function( data ) {});
 } 
}
</script>

<%@ include file="../include/footer.jsp"%>