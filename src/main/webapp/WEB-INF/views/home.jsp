<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="include/header.jsp" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

	<!-- 이미지 슬라이더 -->
	<div class="intro carousel slide bg-overlay-light h-auto" data-ride="carousel" data-interval="4000" id="carouselExampleCaptions">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img class="d-block img-fluid" alt="마술피리" src="${pageContext.request.contextPath }/resources/upload/20190108161143.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="사랑의묘약" src="${pageContext.request.contextPath }/resources/upload/20190108161235.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="헨젤과그레텔" src="${pageContext.request.contextPath }/resources/upload/20190108161430.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="팔리아치" src="${pageContext.request.contextPath }/resources/upload/20190108163201.jpg">
			</div>
			
			<div class="carousel-item">
				<img class="d-block img-fluid" alt="신데렐라" src="${pageContext.request.contextPath }/resources/upload/20190114104538.jpg">
			</div>
		</div>
	
		<!-- button -->
		<a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			<span><img src="${pageContext.request.contextPath }/resources/upload/ico_l_big.png" width="50" height="96"></span>
		</a>
		
		<a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			<span><img src="${pageContext.request.contextPath }/resources/upload/ico_r_big.png" width="50" height="96"></span>
		</a>
		
	</div>	<!-- 슬라이더 끝 -->
		
<%@ include file="include/perfList.jsp" %>	<!-- 공연 리스트 슬라이더 -->
<%@ include file="include/goMenu.jsp" %>	<!-- 메뉴 링크  -->
<%@ include file="include/footer.jsp" %>
