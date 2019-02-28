<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?cc" rel="stylesheet" type="text/css">
<!-- 스마트에디터 경로 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<!-- include FilePond library -->
<link href="https://unpkg.com/filepond/dist/filepond.min.css" rel="stylesheet"/>
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>

<!-- include FilePond plugins -->
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css" rel="stylesheet"/>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>

<!-- include FilePond jQuery adapter -->
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>

<style>
/* filepond */
.filepond--image-preview-overlay svg {
    max-height: inherit;
}

.filepond--label-action{ 
	font-weight: bold;
}        

.filepond--root{
	width: 35%;             
	margin-bottom: 0;                   
}             
        

.filepond--panel-root {
	background-color: white;  
	border: 1px solid #d1d1d1;
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
<div class="container-fluid noticeRegisterWrapper">
	<div class='titleWrapper'>
		<h2 class='text-center'>공지사항</h2>
	</div>
		  
	<div class="register-contents-wrapper">
	
		<form role="form" action="register" method="post" id="frm" enctype="multipart/form-data">
		<table class="table">                 
			<tbody>      
				<tr>
					<th style='width: 20%;'>작성자</th>
					<td>
						<c:forEach	items="${list }" var="memberVO">
							<input type='text' value="${memberVO.gCode.gradeName }" readonly="readonly" name="writer" id="writer">
							<!-- 회원코드 같이 실어서 보내기-->
							<input type="hidden" value="${memberVO.memberCode }" name="memberCode" id="memberCode">
						</c:forEach>   
						      
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type='text' name="title" id="title" placeholder="제목을 입력하세요.">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>     
						<!-- 네이버 스마트 에디터 -->                      
						<textarea name="content" id="content" rows="10" cols="120"></textarea>
					</td>
				</tr>
				<tr>
					<th>알림 여부</th>
					<td>
						<div class="checkbox">
	            			<label>
	            				<input type="checkbox" id="chkNotice" name="chkNotice"><span class="cr"><i class="cr-icon fa fa-check"></i></span>알림
	            				<!-- 체크박스 값을 넘김 -->
	            				<input type="hidden" name="isNotice" id="isNotice">
	            			</label>
	       				</div>
        			</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td>
						<input type="file" id="uploadFiles" name="uploadFiles" multiple="multiple">
					</td>
				</tr>
			</tbody>
		</table>            
		
		<!-- 버튼 -->           
		<div class="btnWrapper">
			<input type="button" value='확인' id='btnConfirm'>
			<input type="reset" value='취소' id='btnCancel'>
	    </div>
		
	</form>
	
	</div>	<!-- register-contents-wrapper end -->
	
</div>	<!-- container end -->

	

<script>
	$(function(){
		
		//전역변수
		var obj = [];
		//스마트에디터 프레임 생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "content",
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
		
		//전송버튼
		$("#btnConfirm").click(function() {
			
			//체크박스 선택 여부에 따라
			if ($('input[name=chkNotice]').is(":checked")) {
				$('input[name=isNotice]').val('1');
			} else {
				$('input[name=isNotice]').val('0');
			}

			//id가 content인 textarea에 에디터를 대입한다.
			obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			//값 받아졌는지 확인하기
			var w = $("#writer").val();
			var mc = $("#memberCode").val();
			var t = $("#title").val();
			var chk = $("#isNotice").val();

			//폼 전송하기
			$("#frm").submit();

		})
	})
</script>
<%@ include file="../include/footer.jsp"%>