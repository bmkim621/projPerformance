<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/common.css?b" rel="stylesheet" type="text/css">
<style>
	.swal-text{
		letter-spacing: -0.5px;
	}
</style>
<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<script>
//		alert("비밀번호가 일치하지 않습니다.");
//		location.href = "${pageContext.request.contextPath }/member/confirmMember";
		swal("", "비밀번호가 일치하지 않습니다.", "warning")
		.then((value) => {
			location.href = "${pageContext.request.contextPath }/member/confirmMember";
		});
	</script> 
</body>
</html>