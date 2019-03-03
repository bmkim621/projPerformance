<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/review.css?a" rel="stylesheet" type="text/css">
<!-- 스마트에디터 경로 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
      
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
	overflow: hidden;
}

.uploadResult ul li div.mywrap .imgFileName{
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	color: #535353!important;
	width: 100px;   
	display: inline-block;
	font-weight: bold;
	float: left;      
}

.uploadResult ul li div.mywrap .imgFileName:hover{
	text-decoration: underline;
}

#mybtn{
	float: right;
	width: 22px;
	height: 22px;
}

.btn{
	padding: 0;
}

#mybtn i{
	position: absolute;
	top: 3px;      
	right: 5.5px;           
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


<!-- 공지사항 -->
<div class="container-fluid reviewRegisterWrapper">
	<div class='titleWrapper'>
		<h2 class='text-center'>공연관람후기</h2>
	</div>
		  
	<div class="register-contents-wrapper">
	
		<div class='col-sm-11 review-notice-wrapper'>
			<p class='review-notice'>본 게시판은 개인정보 보호차원에서 개인정보 등록을 금지합니다.</p>
			<p class='review-notice'>글쓰기 본문이나 첨부에 개인을 식별할 수 있는 개인정보가 없는지 다시한번 확인 후 작성해주시기 바랍니다.</p>
			<p class='review-notice'>(개인정보란: 주민등록번호, 전화번호, 휴대폰번호, 이메일주소 등)</p>
		</div>
	
		<form role="form" action="modify" method="post" id="frm" enctype="multipart/form-data">
		<table class="table">                 
			<tbody>      
				<tr>
					<th style='width: 20%;'>이름</th>
					<td>
						<input type='text' name='reviewWriter' id='reviewWriter' value='${reviewVO.reviewWriter }' readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type='text' name="reviewTitle" id="reviewTitle" placeholder="제목을 입력하세요." value="${reviewVO.reviewTitle }">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>     
						<!-- 네이버 스마트 에디터 -->
						<textarea name="reviewContent" id="reviewContent" rows="10" cols="120">${reviewVO.reviewContent }</textarea>                      	
					</td>
				</tr>
				<tr>
					<!-- ex05 파일 업로드 하는 부분 -->
					<th>파일첨부</th>
					<td>
						<input type="file" name="uploadFile" multiple="multiple">
					</td>
				</tr>
			</tbody>              
		</table>
		
		<!-- 추가한 부분 나타나는 곳 -->
		<div class='uploadResult'>
		<ul></ul>
		</div>             
		
		<!-- 버튼 -->           
		<div class="btnWrapper">
			<input type="button" value='수정' id='btnReviewModify'>
			<input type="reset" value='취소' id='btnReviewCancel'>
	    </div>
	    
	    <!-- 수정할 때 post 방식으로 보내기 위해서 번호랑 페이지번호 같이 보내기(페이지 있는 목록으로 이동해야되니까 페이지 번호도 같이 실어서 보내야 함)-->
		<input type="hidden" name="reviewNo" value="${reviewVO.reviewNo }" >
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
		
	</form>
	
	</div>	<!-- register-contents-wrapper end -->
	
</div>	<!-- container end -->


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
					str += "<div class='mywrap'><span class='imgFileName'>" + attach.reviewFileName + "</span>";
					str += "<button type='button' id='mybtn' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-info'><i class='fa fa-times'></i></button></div>";
					str += "<img src='${pageContext.request.contextPath }/upload/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
				} else{	//이미지 파일 아닌 경우
					
					str += "<li data-path='" + attach.reviewUploadPath + "' data-uuid='" + attach.reviewUuid + "' data-filename='" + attach.reviewFileName + "' data-type='" + attach.reviewFileType + "'><div>";
					str += "<div class='mywrap'><span class='imgFileName'>" + attach.reviewFileName + "</span>";
					str += "<button type='button' id='mybtn' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-info'><i class='fa fa-times'></i></button></div>";
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
		
		var formObj = $("form");
		
		//전역변수
		var obj = [];
		//스마트에디터 프레임 생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "reviewContent",
			sSkinURI: "${pageContext.request.contextPath }/resources/editor/SmartEditor2Skin.html",
			htParams: {
				//툴바 사용 여부(true: 사용, false: 사용X)
				bUseToolbar: true,
				//입력창 크기 조절바 사용 여부(true: 사용)
				bUseVerticalResizer: true,
				//모드 탭(Editor | HTML | TEXT) 사용 여부(true: 사용)
				bUseModeChanger: false
			}
		});
		
		//파일 확장자와 크기를 검사하는 정규표현식(무분별한 업로드 제한)
		//ex. 확장자가 .exe, .zip, .sh, .alz 파일 제한
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		//파일 업로드 크기 제한
		var maxSize = 5242880;	//5MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 크기가 초과되었습니다.");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;
		}
		
		//업로드 결과 처리하는 함수
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){
				return;
			}
			
			var uploadUL = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				//첨부파일의 종류가 이미지라면
				if(obj.image){
					console.log(obj);
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					
					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'></div>";
					str += "<div class='mywrap'><span class='imgFileName'>" + obj.fileName + "</span>";
					str += "<button type='button' id='mybtn' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-info'><i class='fa fa-times'></i></button></div>";
					str += "<img src='${pageContext.request.contextPath }/upload/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
					  
				} else{	//이미지 파일이 아니라면
					
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'><div>";
					str += "<div class='mywrap'><span class='imgFileName'>" + obj.fileName + "</span>";
					str += "<button type='button' id='mybtn' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-info'><i class='fa fa-times'></i></button></div>";
					str += "<img src='${pageContext.request.contextPath }/resources/images/documents.png'></a>";
					str += "</div>";
					str += "</li>";
				}
			}); //each end
			
			uploadUL.append(str);
		}
		
		//파일 내용이 변경되는 것을 감지해서 처리하도록 하기
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;  
			
			for(var i = 0 ; i < files.length ; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			//첨부파일의 경로와 이름, 파일의 종류(이미지 또는 일반 파일)를 전송한다.
			$.ajax({
				url: '${pageContext.request.contextPath}/upload/uploadAjax',
				//첨부파일 전송하기 위해서 반드시 필요
				processData: false,
				contentType: false,
				//끝
				data: formData,
				type: 'post',
				dataType: 'json',
				success: function(result){
					console.log(result);
					
					//업로드 결과 처리 함수
					showUploadResult(result);				
				}
			})	//$.ajax end
		})
		
		//=======================================================
		
		//첨부파일의 X 버튼 클릭하면 화면상에 사라지도록 처리하기
		$(".uploadResult").on("click", "button", function(){
			console.log("delete file");
			if(confirm("파일을 삭제하시겠습니까?")){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		
		//수정버튼
		$("#btnReviewModify").click(function(e){
			e.preventDefault();
			
			//id가 reviewContent인 textarea에 에디터를 대입한다.
			obj.getById["reviewContent"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);        
					
				str += "<input type='hidden' name='attachList[" + i + "].reviewFileName' value='" + jobj.data("filename") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].reviewUuid' value='" + jobj.data("uuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].reviewUploadPath' value='" + jobj.data("path") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].reviewFileType' value='" + jobj.data("type") + "'>";
				});
				formObj.append(str).submit();         
			});
				
	})
</script>

<%@ include file="../include/footer.jsp"%>