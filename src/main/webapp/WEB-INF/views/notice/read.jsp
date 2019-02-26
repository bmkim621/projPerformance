<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?b" rel="stylesheet" type="text/css">

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
<div class="container-fluid tableContainer" id="printarea">
	
	<div class='titleWrapper'>
		<h2 class='text-center'>공지사항</h2><hr>
	</div>
		  

	<div class="table-wrapper" id="printarea">
	<table class="table">     
		          
		<tbody>
			<tr>
				<td>
					<span class='spanTitle'>${noticeVO.title }</span>
					<span class='spanDate'><fmt:formatDate value="${noticeVO.regdate }" pattern="yyyy-MM-dd a hh:mm:ss"/></span>
				</td>   
			</tr>
			<tr>
				<td><span class='spanWriter'>${noticeVO.writer }</span></td>  
			</tr>
			<tr>
				<td class='notice-content'>${noticeVO.content }</td>
			</tr>
			<tr>
				<td>
					<span class='spanFile'>파일</span>
					<span class='fileList'>첨부파일 나오는 곳</span>
				</td>
			</tr>
		</tbody>
	</table>
	
	</div>	<!-- table-wrapper end -->
	
	<!-- 버튼 -->
	<div class="btnWrapper">
    	<a href="#" class='btnGoList'>목록</a>
    	<a href="#" class='btnPrint' onclick="javascript:content_print();">인쇄</a>         
    </div>
    
    <!-- 보내야할 것 : 글번호, 페이지번호, 키워드, 검색종류 -->
	<form action="" method="post" id="f1">
		<input type="hidden" name="no" value="${noticeVO.noticeNo }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">						
	</form> 
</div>	<!-- container end -->


<script>
	$(function(){
		$(".btnGoList").click(function(){
			//form태그에 있는 값을 가져가고 싶으면? 그냥 get 방식으로 보내고, action의 위치를 listPage(이동하려는 주소값)로 넘김.
			$("#f1").attr("action", "list");
			$("#f1").attr("method", "get");
			$("#f1").submit();
		})
	})
</script>

<!-- 프린트 -->
<script>  
	function content_print() {

		var initBody = document.body.innerHTML;
		window.onbeforeprint = function() {
			document.body.innerHTML = document.getElementById('printarea').innerHTML;
		}
		window.onafterprint = function() {
			document.body.innerHTML = initBody;
		}
		window.print();
	}
</script>

<%@ include file="../include/footer.jsp"%>