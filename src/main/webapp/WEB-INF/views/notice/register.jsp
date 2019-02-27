<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?b" rel="stylesheet" type="text/css">
<!-- 제이쿼리 필요 -->
<!-- 스마트에디터 경로 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class='container'>
	<form action="" method="post" id="frm">
		<textarea rows="10" cols="100" name="editor" id="editor" style="width:766px; height: 412px;"></textarea>
		<input type="button" id="savebutton" value="서버전송">
	</form>
</div>

<script>
	$(function(){
		//전역변수
		var obj = [];
		//스마트에디터 프레임 생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: obj,
			elPlaceHolder: "editor",
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
		$("#savebutton").click(function(){
			//id가 smarteditor인 textarea에 에디터를 대입한다.
			obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 전송하기
			$("#frm").submit();
		})
	})
</script>
<%@ include file="../include/footer.jsp"%>