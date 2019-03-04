<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/review.css?a" rel="stylesheet" type="text/css">
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

<c:forEach items="${list }" var='replyVO'>
	<p>${replyVO }</p>
</c:forEach>


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
    		<c:if test="${user.id == login.userid }">	
    			<a href="#" class='btnModify'>수정</a>
    			<a href="#" class='btnRemove'>삭제</a>
    		</c:if>  
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
		<input type="text" class="form-control" id="replyWriter" value="${login.username }" readonly="readonly">
		</div>
		
		<div class="input-group">
			<textarea class="form-control" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." id="newReplyText"></textarea>
			<span class="input-group-btn">
				<button type="button" class="btn btn-danger" id="replyAdd"><i class="fas fa-comment"></i>&nbsp;등록</button>                          
            </span>
		</div>
		          
        <div class="well">                
	        <ul id="sortable">
	        	<li><span class='spanReplyList'><i class="fas fa-heart"></i>댓글 목록<span class='replyCnt'></span></span></li> 
	        </ul>             
        </div>
        
        <div class="replyPageWrapper">
			<ul class="pagination" id="replyPageUl"></ul>
		</div>
		
    </div>        
</div>	<!-- replyContainer end -->



<!-- 댓글 수정 모달창 -->
<div id="editReplyModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>			
				<div class="modal-header">
					<h5 class="modal-title">댓글 수정</h5>				   	
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				
				<div class="modal-body">					
					<div class="form-group">
						<textarea class="form-control" id="replytext" required></textarea>
					</div>
				</div>
				
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="닫기">
					<input type="button" class="btn btn-info" id="btnReplyMod" value="수정" data-rno="">
				</div>
			</form>
		</div>
	</div>
</div>	<!-- modal end -->



			
			
<!-- 템플릿 -->
<script id="template" type="text/x-handlebars-template">
	{{#each.}}
	<li class='replyLi' data-rno="{{replyNo}}" data-id="{{replyerId}}">
		<div class='temp'>
			<span class='spanReplyWriter'><span class='spanReplyNo'>{{replyNo}}</span>{{replyer}}</span>
	    	<span class="spanReplyDate"><i class="far fa-clock"></i>{{tempDate regdate}} {{temptime regdate}}</span>
		</div>

	{{#ifCond replyerId }}
    	<div class='replyContentsWrap'>
			<span class='spanReplyContents'>{{replyContent}}</span>
			<div class='replyBtnWrap'>
				<button type="button" class="btn btn-primary btn-sm btnModify" data-toggle="modal" data-target="#editReplyModal" data-rno="{{replyNo}}">수정</button>
				<button type="button" class="btn btn-danger btn-sm btnDelete">삭제</button>
			</div>
		</div>  
	{{else}}
		<div class='replyContentsWrap'>
			<span class='spanReplyContents'>{{replyContent}}</span>
		</div>
	{{/ifCond}}         	
	</li>
	{{/each}}
</script>				        

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
	
	
	// ==================== 댓글 ============================
	//댓글 날짜 헬퍼
	Handlebars.registerHelper("tempDate", function(value){
		var date = new Date(value);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		return year + "-" + month + "-" + day; 
	})
	
	//댓글 시간 헬퍼
	Handlebars.registerHelper("temptime", function(value){
		var date = new Date(value);
		var hour = date.getHours();
		var minutes = date.getMinutes();
		
		return hour + ":" + minutes; 
	})
	
	//조건 헬퍼
	//Handlebar if문
	Handlebars.registerHelper('ifCond', function(v1, options) {
		if(v1 == '${login.userid }') {
			return options.fn(this);  
		}
		return options.inverse(this);
	});
		
	
	var reviewNo = ${reviewVO.reviewNo };
	var no = ${reviewVO.reviewNo };
//	console.log(reviewNo);
	var replyer = $("#replyWriter").val();
                                                                       
                                   
	//댓글 페이지
	function getPageList(page){
		$.ajax({
			url: "${pageContext.request.contextPath}/replies/" + reviewNo + "/" + page,
			type: "get",
			dataType: "json",
			success: function(json){
				console.log(json);
//				console.log(json.list ); 
				
				//아이디
/* 				$(json.list).each(function(i, obj){
					var userid = obj.replyerId;
					
					console.log(userid);
					
					if(userid == '${login.userid }'){
						alert("테스트");
					}
				}) */
				
				$(".replyLi").remove();
				
				var source = $("#template").html();
				var f = Handlebars.compile(source);
				var result = f(json.list);
				
				$("#sortable").append(result);
				
				//댓글 추가 시 댓글목록 옆에 댓글 수 증가
				$(".replyCnt").text("["+json.replycnt+"]");
				
				//댓글 페이지
				$(".pagination").empty();
				
				for(var i = json.pageMaker.startPage ; i <= json.pageMaker.endPage ; i++){
					var liTag = $("<li>").addClass("page-item");
					var aTag = $("<a>").attr("href", "#").append(i);
					liTag.append(aTag);
					
					//시작하는 페이지가 선택한 페이지와 같으면
					if(i == json.pageMaker.cri.page){
						liTag.addClass("active");
					}
					$(".pagination").append(liTag);
				}
				
			}
		})
	}

	$(function(){
		
		getAttach();	//첨부파일
		getPageList(1);	//댓글불러오기
		
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
		
		
		// ==================== 댓글 ============================
		$("#replyAdd").click(function(){
			//댓글 등록할 때 : 댓글 작성자, 댓글 내용, 후기 번호(변수로 선언)
			var replyContent = $("#newReplyText").val();
//			console.log(replyer);
//			console.log(replyContent);
			
			var jsonBody = {reviewNo: reviewNo, replyer: replyer, replyContent: replyContent};
			
				$.ajax({
					url: "${pageContext.request.contextPath}/replies/",
					type: "post",
					//stringify 사용할 때 headers도 같이 사용해야 함.
					headers:{
						"Content-Type": "application/json",
						"X-HTTP-Method-Override": "POST"
					},
					
					data: JSON.stringify(jsonBody),	
					dataType: "text",
					success: function(json){
//						console.log(json);
												
						if(json == "success"){
							alert("등록하였습니다.");
							
							getPageList(1);    
							
							//댓글 작성 후 내용 비우기
							$("#replyContent").val("");         

						}           
					}
				})
			
			return false;
		})
		
		
		//댓글 페이지 이동
		// ====== 페이지 이동 : 동적으로 버튼 생기니까 on 사용해야 함. ======
		$(document).on("click", ".pagination a", function(e){
			 e.preventDefault();	//클릭 차단
			 
			 //내가 몇 번째 클릭하는지 어떻게 알지? => 일단 페이지 번호를 가지고 온다. <a>안에 페이지 번호 있으니까 this
			 var num = $(this).text();
			 getPageList(num);	
		})
		
		
		// ====== 댓글에 있는 수정버튼 : 동적으로 버튼 만들어지까 on 사용해야 함. ======
		$(document).on("click", ".btnModify", function(){
			//rno 가져오기
			var rno = $(this).attr("data-rno");
			$("#btnReplyMod").attr("data-rno", rno);
			
			//댓글 내용 가지고오기
			var replytext = $(this).parent().prev().html();
//			console.log(text);
			$("#replytext").val(replytext);
		})
		
		
		// 댓글 내용 수정하기
		$(document).on("click", "#btnReplyMod", function(){
			var replyNo = $("#btnReplyMod").attr("data-rno");
			var replyContent = $("#replytext").val();
			var jsonBody = {replyContent: replyContent};
			
			//ajax로 보냄.
			$.ajax({
				url: "${pageContext.request.contextPath}/replies/" + replyNo,
				type: "put",
				//보낼 데이터 => int rno와 vo(RequestBody있으니까 headers, stringify 필요)
				headers:{
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT"
				},
				data: JSON.stringify(jsonBody),	
				dataType: "text",
				success: function(json){
					console.log(json);
					
					if(json == "success"){
						alert(replyNo + " 수정되었습니다.");   
					}
					
					//수정되고 나서 창 안보이게 처리한다.
					$("#editReplyModal").modal("hide");  
					
					//리스트 갱신시킨다.
					getPageList(1);
				}			
			})
		})
		
		
		// 댓글 삭제(동적으로 버튼 생기니까 on 사용해야 함)
		$(document).on("click", ".btnDelete", function(){
			//삭제할 때 rno 필요하니까 가져온다.
			var replyNo = $(this).parents(".replyLi").attr("data-rno");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/replies/" + replyNo,
				type: "delete",
				dataType: "text",
				success: function(json){
					console.log(json);
					
					if(json == "Success"){
						alert("삭제되었습니다.");
					}
					//리스트 갱신시킨다.
					getPageList(1);
				}
			})
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

