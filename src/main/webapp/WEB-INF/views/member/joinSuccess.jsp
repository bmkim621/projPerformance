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
		swal("축하합니다!", "(재)대구오페라하우스 회원가입이 완료되었습니다.", "success")
		.then((value) => {
			location.href = "${pageContext.request.contextPath }";
		});
	</script> 
</body>
</html>