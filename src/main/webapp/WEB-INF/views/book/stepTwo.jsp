<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?abc" rel="stylesheet" type="text/css">
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
	width: 15px;
	height: 15px;     
	border: 1px solid black;
	background-color: gray;
}   

div.aWrapper{    
	display: inline-block;
	width: 150px;   
	height: 210px;   
	border: 1px solid red;
	text-align: center;
	padding: 5px;     
	overflow: hidden;     
}

div.bWrapper{
	display: inline-block;
	width: 150px;   
	height: 210px;   
	border: 1px solid orange;
	text-align: center;
	padding: 5px;     
	overflow: hidden; 
}
                  
div.cWrapper{
	display: inline-block;
	width: 150px;   
	height: 210px;   
	border: 1px solid green;
	text-align: center;
	padding: 5px;     
	overflow: hidden; 
}

div.gradeR{
	background-color: purple;
}

div.gradeS{
	background-color: orange;
}

div.gradeA{
	background-color: green;
}

div.gradeB{
	background-color: pink;
}

div.booked{
	background-color: black;     
}

div.chkSeat{
	background-color: lightblue;
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
				
				<c:if test="${list[0].locCode eq 'SEAT1' }">
					<div class='aWrapper'>
					<c:forEach begin="${list[0].startLoc }" end="${list[0].endLoc }" var="x">
						<div class='seatContainer' data-seatzone='${list[0].zone }' data-seatnum='${x }'></div>  
						<c:if test="${x % row == 0 }"><br></c:if>  
					</c:forEach>
					</div>
					 
					<div class='bWrapper'> 
					<c:forEach begin="${list[1].startLoc }" end="${list[0].endLoc }" var="y">
						<div class='seatContainer' data-seatzone='${list[1].zone }' data-seatnum='${y }'></div>
						<c:if test="${y % row == 0 }"><br></c:if>
					</c:forEach>
					</div>
					
					<div class='cWrapper'>
					<c:forEach begin="${list[2].startLoc }" end="${list[0].endLoc }" var="z">
						<div class='seatContainer' data-seatzone='${list[2].zone }' data-seatnum='${z }'></div>
						<c:if test="${z % row == 0 }"><br></c:if>
					</c:forEach>
					</div> 
				</c:if>
				
				
				
				

			<c:if test="${list[0].locCode eq 'SEAT2' }">
					<div class='aWrapper'>
					<c:forEach begin="${list[0].startLoc }" end="${list[0].endLoc }" var="x">  
					
				<c:if test="${x <= (row * 2) }">
							<div class='seatContainer gradeR' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='R'>
							</div>
							
							<c:if test="${x % row == 0 }"><br></c:if>
						</c:if>
						
						<c:if test="${ x >= (row * 2) + list[0].startLoc && x <= (row * 4) }">
							
							<div class='seatContainer gradeS' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='S'>
							</div>  
							
							<c:if test="${x % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ x >= (row * 4) + list[0].startLoc && x <= (row * 6) }">
							<div class='seatContainer gradeA' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='A'></div>
							<c:if test="${x % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ x >= (row * 6) + list[0].startLoc && x <= (row * 8) }">
							<div class='seatContainer gradeB' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='B'></div>
							<c:if test="${x % row == 0 }"><br></c:if>
						</c:if>
											
					</c:forEach>
					</div>
					
					
					
					<!-- B구역 -->
					<div class='bWrapper'>
					
					<c:forEach begin="${list[1].startLoc }" end="${list[1].endLoc }" var="y">  
					
					<c:if test="${y <= (row * 2) }">
							<div class='seatContainer gradeR' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='R'>
							</div>
							
							<c:if test="${y % row == 0 }"><br></c:if>
						</c:if>
						
						<c:if test="${ y >= (row * 2) + list[1].startLoc && y <= (row * 4) }">
							
							<div class='seatContainer gradeS' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='S'>
							</div>  
							
							<c:if test="${y % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ y >= (row * 4) + list[1].startLoc && y <= (row * 6) }">
							<div class='seatContainer gradeA' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='A'></div>
							<c:if test="${y % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ y >= (row * 6) + list[1].startLoc && y <= (row * 8) }">
							<div class='seatContainer gradeB' data-seatzone='${list[1].zone }' data-seatnum='${y }' data-seatgrade='B'></div>
							<c:if test="${y % row == 0 }"><br></c:if>
						</c:if>		 
					
					</c:forEach>
					
					</div>
					
					
					<!-- C구역 -->
					<div class='cWrapper'>
					
					<c:forEach begin="${list[2].startLoc }" end="${list[2].endLoc }" var="z">  
					
					<c:if test="${z <= (row * 2) }">
							<div class='seatContainer gradeR' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='R'>
							</div>
							
							<c:if test="${z % row == 0 }"><br></c:if>
						</c:if>
						
						<c:if test="${ z >= (row * 2) + list[2].startLoc && z <= (row * 4) }">
							
							<div class='seatContainer gradeS' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='S'>
							</div>  
							
							<c:if test="${z % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ z >= (row * 4) + list[2].startLoc && z <= (row * 6) }">
							<div class='seatContainer gradeA' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='A'></div>
							<c:if test="${z % row == 0 }"><br></c:if>
						</c:if> 
						
						<c:if test="${ z >= (row * 6) + list[2].startLoc && z <= (row * 8) }">
							<div class='seatContainer gradeB' data-seatzone='${list[2].zone }' data-seatnum='${z }' data-seatgrade='B'></div>
							<c:if test="${z % row == 0 }"><br></c:if>  
						</c:if>		 
					
					</c:forEach>
					
					</div>
					
					
					
				</c:if>  
				
				<div class='seatResultWrapper'>
					선택한 좌석 : <span id='spanResultInfo'>&nbsp;&nbsp;</span>
				</div>
				
				<div class='btnWrapper'><button id="goThird" type="button">다음단계</button></div>
				    
				  
				
           
	  
			
	  		                              
		</div>             
	</div>
</div> 
</div>

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
			
//			console.log(selectSeatNum);
//			console.log(selectSeatZone);
			
			
			me.addClass("chkSeat");  
//			$(".chkSeat").unbind('click');              
			
			$.ajax({
				url: "${pageContext.request.contextPath}/book/insertTempSeat",
				type: "POST",
				data : {selectShowCode: selectShowCode, selectSeatZone: selectSeatZone, selectSeatNum: selectSeatNum},
				success: function(data){
//					console.log(data);  
					if(data == "success"){
//						alert("완료");
	//					$("#spanSeatZone").html(selectSeatZone + "구역 ");
	//					$("#spanSeatNum").html(selectSeatNum + "번");
						str = "";    
						str += "<span class='span-wrapper'><span id='spanSeatZone'>" + selectSeatZone + "구역 </span><span id='spanSeatNum'>" + selectSeatNum + "</span>번</span>";
						$("#spanResultInfo").append(str);
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
					}
					    
				}
				            
			})	//ajax end  

		})
		
		//예약된 좌석 클릭 못하게 한다.
		$(".booked").unbind('click');  
 		
 		$("#goThird").click(function(){
 			location.href = "${pageContext.request.contextPath}/book/stepThree";
 		})
 		
	})   
</script>


<%@ include file="../include/footer.jsp"%>