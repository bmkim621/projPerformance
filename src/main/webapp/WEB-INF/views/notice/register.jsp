<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?bbb" rel="stylesheet" type="text/css">
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
.filepond--image-preview-overlay svg {
    max-height: inherit;
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
	
		<table class="table">               
			<tbody>
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>제목들어갈부분</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<!-- 네이버 스마트 에디터 -->
						<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
					</td>
				</tr>
				<tr>
					<th>알림 여부</th>
					<td><input type="checkbox" class='chkNotice' name="chkNotice">알림</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" class="my-pond" name="filepond"></td>
				</tr>
			</tbody>
		</table>
	
	</div>	<!-- register-contents-wrapper end -->
	
	<!-- 버튼 -->
	<div class="btnWrapper">
		
    	      
    </div>

</div>	<!-- container end -->

<div class='container'>
	<form action="" method="post" id="frm">
		
		
	</form>
</div>

<script>
	$(function(){
		
		// First register any plugins
		$.fn.filepond.registerPlugin(FilePondPluginImagePreview);

		// Turn input element into a pond
	    $('.my-pond').filepond();

	    // Turn input element into a pond with configuration options
	    $('.my-pond').filepond({
	        allowMultiple: true
	    });

	    // Set allowMultiple property to true
	    $('.my-pond').filepond('allowMultiple', true);
	  
	    // Listen for addfile event
	    $('.my-pond').on('FilePond:addfile', function(e) {
	        console.log('file added event', e);
	    });
             
		//전역변수
		var obj = [];
		//스마트에디터 프레임 생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "ir1",
			sSkinURI: "${pageContext.request.contextPath }/resources/editor/SmartEditor2Skin.html",
			htParams: {
				//툴바 사용 여부(true: 사용, false: 사용X)
				bUseToolbar: true,
				//입력창 크기 조절바 사용 여부(true: 사용)
				bUseVerticalResizer: true,
				//모드 탭(Editor | HTML | TEXT) 사용 여부(true: 사용)
				bUseModeChanger: true
			}
		});
		
		//전송버튼
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터를 대입한다.
			obj.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 전송하기
			$("#frm").submit();
		})
	})
</script>
<%@ include file="../include/footer.jsp"%>