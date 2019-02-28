<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?aa" rel="stylesheet" type="text/css">

<style>
	div.item{
		width: 100px;
		margin: 5px;
		display: inline-block; 
	}
</style>         

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
					
						<c:forEach items="${noticeVO.files }" var="file">
						<div class='item'>  
							<img src='displayFile?filename=${file }'>
						</div>   
						</c:forEach>  
				</td>
			</tr>
		</tbody>
	</table>
	
	</div>	<!-- table-wrapper end -->
	
	<!-- 이미지 감싸는 div 조절 -->
	<script>
		//image의 크기를 구하여 div.item의 크기 조정 [
		$(".item").each(function(i, obj) {
			var img = new Image();
			img.onload = function() {
				$(obj).css("width", this.width);
			}
			img.src = $(obj).find("img").attr("src");
			// ]
		})
	</script>

	<!-- 버튼 -->
	<div class="btnWrapper">
    	<a href="#" class='btnGoList'>목록</a>
    	<a href="#" class='btnPrint' onclick="javascript:content_print();">인쇄</a>
    	<!-- 관리자로 로그인 했을 경우에만 버튼 나오도록--> 
    	<c:if test="${login != null && login.isMember == 1 }">
    		<a href="#" class='btnModify'>수정</a>
    		<a href="#" class='btnDelete'>삭제</a>        
     	</c:if>    
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
		//목록
		$(".btnGoList").click(function(){
			//form태그에 있는 값을 가져가고 싶으면? 그냥 get 방식으로 보내고, action의 위치를 listPage(이동하려는 주소값)로 넘김.
			$("#f1").attr("action", "list");
			$("#f1").attr("method", "get");
			$("#f1").submit();
		})
		
		//수정
		$(".btnModify").click(function(){
			$("#f1").attr("action", "modify");
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