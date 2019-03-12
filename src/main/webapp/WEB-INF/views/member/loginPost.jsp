<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("정보가 정확하지 않습니다. 다시 입력해주세요.");
		location.href = "${pageContext.request.contextPath }/member/login";     
	</script>

</body>
</html>