<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/review.css?abcb" rel="stylesheet" type="text/css">

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

<div class="container-fluid reviewContainer">
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

<!-- 후기 읽기 -->
<div class="container-fluid reviewTableContainer">

	<div class='titleWrapper'>
		<h2 class='text-center'>공연관람후기</h2><hr>
	</div>
	
	<div class="table-wrapper" id="printarea">
		<div class="table-filter">
			<div class="row">                           
				<div class='col-sm-11 review-notice-wrapper'>
					<p class='review-notice'>본 게시판은 개인정보 보호차원에서 개인정보 등록을 금지합니다.</p>
					<p class='review-notice'>글쓰기 본문이나 첨부에 개인을 식별할 수 있는 개인정보가 없는지 다시한번 확인 후 작성해주시기 바랍니다.</p>
					<p class='review-notice'>(개인정보란: 주민등록번호, 전화번호, 휴대폰번호, 이메일주소 등)</p>
				</div>
			</div>
		</div>	<!-- table-filter end -->
		
		<table class="table">           
			<tbody>
				<tr>
					<td>
						<span class='spanTitle'>${reviewVO.reviewTitle }</span>
						<span class='spanDate'><fmt:formatDate value="${reviewVO.reviewPostDate }" pattern="yyyy-MM-dd a hh:mm:ss"/></span>
					</td>   
				</tr>
				<tr>
					<td><span class='spanWriter'>${reviewVO.reviewWriter }</span></td>  
				</tr>
				<tr>
					<td class='notice-content'>${reviewVO.reviewContent }</td>
				</tr>		
			</tbody>
		</table>
		
		<!-- 첨부파일의 목록을 보여주는 부분 -->
		<div class='uploadResult'>
			<ul></ul>
		</div>
	</div>	<!-- table-wrapper end -->
	
	<!-- 버튼 -->
	<div class="btnReviewWrapper">
		<div class='btnWrapperLeft'>
	    	<a href="#" class='btnReviewGoList'>목록</a>
	    	<a href="#" class='btnReviewPrint' onclick="javascript:content_print();">인쇄</a>
    	</div>
    	<div class='btnWrapperRight'>
    		<a href="#" class='btnRegister'>글쓰기</a>
    		<a href="#" class='btnModify'>수정</a>
    		<a href="#" class='btnRemove'>삭제</a>
    	</div>  
    </div>
    
    <!-- 보내야할 것 : 글번호, 페이지번호, 키워드, 검색종류 -->
	<form action="" method="post" id="f1">
		<input type="hidden" name="no" value="${reviewVO.reviewNo }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">						
	</form> 
    
</div>	<!-- container end -->


<!-- 댓글 -->
<div class='container replyContainer'>
	<div class="text-center">
		<div class="input-group">       
		<input type="text" class="form-control" placeholder="Username" aria-label="Username" id="replyWriter">
		</div>
		
		<div class="input-group">
			<textarea class="form-control" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
			<span class="input-group-btn">
				<button type="button" class="btn btn-danger" id="replyAdd"><i class="fas fa-comment"></i>&nbsp;등록</button>                          
            </span>
		</div>
		
        <div class="well">
            
        <ul id="sortable">
            <li>
            	<div class='temp'>
            		<span class='spanReplyWriter'>댓글 작성자 테스트1</span>
	            	<span class="spanReplyDate"><i class="far fa-clock"></i>2019-03-04 오전 1:41</span>
            	</div>
            	<div class='replyContentsWrap'>
            		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            	</div>         	
            </li>
            
            <li>
	            <div class='temp'>
            		<span class='spanReplyWriter'>댓글 작성자 테스트1</span>
	            	<span class="spanReplyDate"><i class="far fa-clock"></i>2019-03-04 오전 1:41</span>
            	</div>           
            	<div class='replyContentsWrap'>
            		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
            	</div>
            </li>
        </ul>             
        </div>
    </div>        
</div>	<!-- replyContainer end -->
				        

<script>
	//첨부파일 가지고 오기
	function getAttach(){
		var reviewNo = '<c:out value="${reviewVO.reviewNo }"/>';
		$.getJSON("${pageContext.request.contextPath}/review/getReviewAttachList", {reviewNo: reviewNo}, function(arr){
			console.log(arr);
			
			//첨부파일 보여주기
			var str = "";
			
			$(arr).each(function(i, attach){
				        
				//이미지 파일인 경우
				if(attach.reviewFileType){  
					var fileCallPath = encodeURIComponent(attach.reviewUploadPath + "/s_" + attach.reviewUuid + "_" + attach.reviewFileName);
					str += "<li data-path='" + attach.reviewUploadPath + "' data-uuid='" + attach.reviewUuid + "' data-filename='" + attach.reviewFileName + "' data-type='" + attach.reviewFileType + "'><div>";
					str += "<div class='mywrap'><img src='${pageContext.request.contextPath }/resources/images/attach.gif' class='att'><span class='imgFileName'>" + attach.reviewFileName + "</span></div><img src='${pageContext.request.contextPath }/upload/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
				} else{	//이미지 파일 아닌 경우
					
					str += "<li data-path='" + attach.reviewUploadPath + "' data-uuid='" + attach.reviewUuid + "' data-filename='" + attach.reviewFileName + "' data-type='" + attach.reviewFileType + "'><div>";
					str += "<div class='mywrap'><img src='${pageContext.request.contextPath }/resources/images/attach.gif' class='att'><span class='imgFileName'>" + attach.reviewFileName + "</span></div>";  
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
		$(".btnReviewGoList").click(function(){
			//form태그에 있는 값을 가져가고 싶으면? 그냥 get 방식으로 보내고, action의 위치를 listPage(이동하려는 주소값)로 넘김.
			$("#f1").attr("action", "list");
			$("#f1").attr("method", "get");
			$("#f1").submit();
		})
		
		//글쓰기
		$(".btnRegister").click(function(){
			location.href = "${pageContext.request.contextPath}/review/register";
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
		$(".btnRemove").click(function(){
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

