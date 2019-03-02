<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?aa" rel="stylesheet" type="text/css">

<!-- 첨부파일 스타일 -->
<style>
.uploadResult{
	width: 100%;               
	border-top: 1px solid #f0f0f0;
	margin: 20px auto;
	padding: 10px;
}

.uploadResult ul{
	padding: 0;
	margin: 0;
	list-style: none;
	overflow: hidden;
}

.uploadResult ul li{
	float: left;
	width: 150px;
/* 	border: 1px solid #ccc; */
	padding: 8px;         
	margin-right: 15px;
	list-style: none;
}

.uploadResult ul li img{
	width: 125px;                     
	margin-top: 5px;
}

.uploadResult ul li span{
	color: white;
}

.uploadResult ul li div.mywrap{
	position: relative;
	width: 100%;
	margin: 0 auto;
}

.uploadResult ul li div.mywrap .imgFileName{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	color: #535353!important;
	width: 100px;   
	display: inline-block;
	font-weight: bold;      
}

.uploadResult ul li div.mywrap .imgFileName:hover{
	text-decoration: underline;
}

.att{
	position: absolute;
	top: 5px;              
	left: 0;
	width: 13px!important;
	height: 15px!important;
	margin: 0!important;
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
			
		</tbody>
	</table>
	
	<!-- 첨부파일의 목록을 보여주는 부분 -->
	<div class='uploadResult'>
		<ul></ul>
	</div>
	
	</div>	<!-- table-wrapper end -->

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
	//첨부파일 가지고 오기
	function getAttach(){
		var noticeNo = '<c:out value="${noticeVO.noticeNo }"/>';
		$.getJSON("${pageContext.request.contextPath}/notice/getAttachList", {noticeNo: noticeNo}, function(arr){
			console.log(arr);
			
			//첨부파일 보여주기
			var str = "";
			
			$(arr).each(function(i, attach){
				
				//이미지 파일인 경우
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
					str += "<div class='mywrap'><img src='${pageContext.request.contextPath }/resources/images/attach.gif' class='att'><span class='imgFileName'>" + attach.fileName + "</span></div><img src='${pageContext.request.contextPath }/upload/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
				} else{	//이미지 파일 아닌 경우
					
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
					str += "<div class='mywrap'><img src='${pageContext.request.contextPath }/resources/images/attach.gif' class='att'><span class='imgFileName'>" + attach.fileName + "</span></div>";  
					str += "<img src='${pageContext.request.contextPath }/resources/images/documents.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			$(".uploadResult ul").html(str);
		});
	}

	$(function(){
		
		getAttach();
		
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
		
		//첨부파일 클릭 시 이벤트 처리(이미지: 원본, 파일 : 다운로드)
		$(".uploadResult").on("click", "li", function(e){
			console.log("view image");
			
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
			
			if(liObj.data("type")){
				//이미지 파일인 경우 이미지 원본을 보여주는 사용자 함수 호출 => 일단 다운로드되게 바꿈.
//				showImage(path.replace(new RegExp(/\\/g), "/"));
				self.location = "${pageContext.request.contextPath }/upload/download?fileName=" + path
			} else{
				//이미지 파일 아닌 경우 다운로드
				self.location = "${pageContext.request.contextPath }/upload/download?fileName=" + path
			}
		});
		
		//공지사항 삭제
		$(".btnDelete").click(function(){
			var delConfirm = confirm("삭제하시겠습니까?");
			
			if(delConfirm){
				$("#f1").attr("action", "remove");
				$("#f1").submit();
			}
			return false;
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