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
	width: 10px;
	height: 10px;
	border: 1px solid black;
	background-color: gray;
}

div.aWrapper{    
	display: inline-block;
	width: 100px;   
	height: 210px;   
	border: 1px solid red;
	text-align: center;
	padding: 5px;     
	overflow: hidden;     
}

div.bWrapper{
	display: inline-block;
	width: 100px;   
	height: 210px;   
	border: 1px solid orange;
	text-align: center;
	padding: 5px;     
	overflow: hidden; 
}

div.cWrapper{
	display: inline-block;
	width: 100px;   
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

.test{
	z-index: 999;
}
</style>

<script>  
 

 
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



<c:forEach items="${reservedSeat }" var="rs">
	<p>${rs }</p>
</c:forEach>
${reservedSeat }
<c:forEach items="${reservedSeat }" var="seat">
<c:set var="xx" value="${seat.bookNum }"></c:set>
</c:forEach>

<h2>${r }</h2>

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
				<p>${list[0] }</p>
				<p>${list[0].zone }</p>        
				<p>${list[0].startLoc }</p>
				<p>${list[0].endLoc }</p>
				<p>${row }</p>
				
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
				
				
				
				
			<c:set var="break" value="false" />
			<c:forEach items="${reservedSeat }" var="seat">
			${seat }
			</c:forEach>
				
			<c:if test="${list[0].locCode eq 'SEAT2' }">
					<div class='temptemp' style='border:1px solid red;'>
					<c:forEach begin="${list[0].startLoc }" end="${list[0].endLoc }" var="x">  
					
				<c:if test="${x <= (row * 2) }">
							<div class='seatContainer gradeR' data-seatzone='${list[0].zone }' data-seatnum='${x }' data-seatgrade='R'>
							</div>
							
							<c:forEach items="${reservedSeat }" var="zz">
								<c:if test="${zz.bookNum == x}">*</c:if>
							</c:forEach>
							
							 
							<c:if test="${x % row == 0 }"><br></c:if>
						</c:if>
						
						<c:if test="${ x >= (row * 2) + list[0].startLoc && x <= (row * 4) }">
							
							
							<c:forEach items="${reservedSeat }" var="zz">
								<c:if test="${zz.bookNum == x && zz.bookZone == 'S'}">*</c:if>
								<c:if test="${zz.bookNum != x && zz.bookZone == 'S'}">
								
								</c:if>
							</c:forEach>
							
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
				</c:if>  
				
				    
				  
				
           
	  
			
	  		                              
		</div>             
	</div>
</div> 
</div>
           
<script>

	var seat = [<c:forEach items="${reservedSeat }" var="seat">${seat.bookNum},</c:forEach>];
	var zone = [<c:forEach items="${reservedSeat }" var="seat">'${seat.bookZone}',</c:forEach>];
	
 	$(function(){
 		$.each(seat, function(i, obj){
//			alert(obj);

		})
		
	}) 
</script>


<%@ include file="../include/footer.jsp"%>