<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?baa" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/member.css?a" rel="stylesheet" type="text/css">

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

<!-- 후기 리스트 -->
<div class="container-fluid bookTableContainer">
	
	<div class='titleWrapper'>
		<h2 class='text-center'>나의 예매내역</h2><hr>
	</div>
	
	<div class="table-wrapper">
	
	<table class="table table-striped table-hover">     
		<thead>
			<tr>                              
				<th class='text-center'>예매번호</th>        
				<th class='text-center'>공연명</th>
				<th class='text-center'>관람일시</th>						
				<th class='text-center'>좌석</th>						
			</tr>
		</thead>
		          
		<tbody>
			<c:forEach items="${list }" var="book">
				<tr>      
					<td class='text-center'>${book.bookNumber }</td> 
					<td>${book.sCode.showName }</td>                                               
					<td class='text-center'><fmt:formatDate value="${book.bookDate }" pattern="yyyy년 MM월 dd일 E요일"/>&nbsp;&nbsp;<fmt:formatDate value="${book.bookTime }" pattern="HH시 mm분"/></td>  
					<c:if test="${book.seatGrade eq 'N' }">
						<td class='text-center'>전석 ${book.bookZone }구역 ${book.bookNum }번</td>
					</c:if>
					<c:if test="${book.seatGrade ne 'N' }">
						<td class='text-center'>${book.seatGrade}석 ${book.bookZone }구역 ${book.bookNum }번</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	    
	</div>	<!-- table-wrapper end -->
</div>










<%@ include file="../include/footer.jsp"%>