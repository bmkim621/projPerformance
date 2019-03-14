<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->  
<link href="${pageContext.request.contextPath }/resources/css/book.css?baa" rel="stylesheet" type="text/css">

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
<div class="container bookResultWrapper">                                     
	<div class='book-result-wrapper'>
		<div class="row">          
			<div class="col-md-12" id='bookResultContainer'>        
				<h3 class="text-center">예매가 완료되었습니다.</h3>
				<div class='resultBtnWrapper'>
					<button type="button" id='btnGoHome'>홈으로</button>
					<button type="button" id='btnGoBookList'>나의 예매내역 보기</button>
				</div>
			</div>	<!-- col-md-8 end -->
		</div>	<!-- row end -->
	</div>	<!-- book-step-wrapper end -->
</div>	<!-- bookWrapper end -->		

<script>
	$(function(){
		$("#btnGoHome").click(function(){
			location.href = "${pageContext.request.contextPath}";       
		})
		
		//예매내역 버튼
		$("#btnGoBookList").click(function(){
			location.href = "${pageContext.request.contextPath}/member/bookInfo";      
		})
	})
</script>
          
<%@ include file="../include/footer.jsp"%>