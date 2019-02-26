<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?aa" rel="stylesheet" type="text/css">

<div class="container-fluid noticeContainer">
	<div class="row">
		<div class="col-sm-12" id="bgWrapper">   
			<!-- 타이틀 -->
			<div class="headline">
				<p class="korHeadline">커뮤니티</p>
				<p class="engHeadline">Community</p>
			</div>
			<!-- headline end -->
		</div>
		<!-- col-sm-12 end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->

<!-- 공지사항 -->
<div class='container-fluid readContainer'>
	<div class='readTitleWrapper'>
		<h2 class='text-center'>공지사항</h2><hr>
	</div>
	
	<div class='read-rable-wrapper'>
	
	</div>
</div>


<%@ include file="../include/footer.jsp"%>