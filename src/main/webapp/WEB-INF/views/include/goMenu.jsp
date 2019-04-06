<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goMenu.css?ab">

<style>

</style>

<div class="container myWrapper col-md-12">
	<div class="row">
		<div class="bannerInner">
			<!-- 배너1 -->
			<div class="bannerWrap">

				<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/mbn_bgimg1.png" alt="대구오페라하우스">
	
				<div class="contents">
					<span class="engTitle">Daegu Opera House</span>
					<span class="korTitle">대구오페라하우스</span>
					<!-- 버튼 -->
					<a href="#" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;VIEW</a>
				</div>
			</div>
			
			<!-- 배너2 -->
			<div class="bannerWrap">

				<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/mbn_bgimg2.png" alt="티켓예매안내">
	
				<div class="contents">
					<span class="engTitle">Ticket Booking Information</span>
					<span class="korTitle">티켓예매안내</span>
					<!-- 버튼 -->
					<a href="#" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;VIEW</a>         
				</div>
			</div>
			
			<!-- 배너3 -->
			<div class="bannerWrap">

				<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/mbn_bgimg6.png" alt="대관안내">
	
				<div class="contents">
					<span class="engTitle">Space Rental</span>
					<span class="korTitle">대관안내</span>
					<!-- 버튼 -->
					<a href="#" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;VIEW</a>         
				</div>
			</div>
			
			<!-- 배너4 -->
			<div class="bannerWrap">

				<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/mbn_bgimg7.png" alt="갤러리">
	
				<div class="contents">
					<span class="engTitle">Gallery</span>
					<span class="korTitle">갤러리</span>
					<!-- 버튼 -->
					<a href="#" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;VIEW</a>         
				</div>
			</div>
			
		</div>	<!-- bannerInner end -->
		
		<div class="noticeInner">
			<div class="miniBannerContainer">
				<!-- 미니 배너1 -->
				<div class="miniBannerWrap">
					<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/sbn_bgimg1.png" alt="코코아">
						
					<div class="miniContents">
						<span class="engMiniTitle">CO-COA</span>
						<span class="korMiniTitle">코코아</span>
					</div>
				</div>
					
				<!-- 미니 배너2 -->
				<div class="miniBannerWrap">
					<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/sbn_bgimg2.png" alt="오페라프랜즈">
						
					<div class="miniContents">
						<span class="engMiniTitle">Opera Friends</span>
						<span class="korMiniTitle">오페라 프랜즈</span>
					</div>
				</div>
					
				<!-- 미니 배너3 -->
				<div class="miniBannerWrap">
					<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/sbn_bgimg3.png" alt="오페라네이버">
					
					<div class="miniContents">
						<span class="engMiniTitle">Opera Neughbor</span>
						<span class="korMiniTitle">오페라 네이버</span>
					</div>
				</div>
			</div>	<!-- miniBannerContainer end -->
			

			<!-- 공지사항 -->
			<div class="noticeWrap">
				<div class="noticeContents">
					<span class="noticeEngTitle">Notice</span>
					<span class="noticeKorTitle">공지사항
					<!-- 버튼 -->
					<a href="#" class="btn btn-primary"><i class="fas fa-arrow-right"></i>&nbsp;VIEW</a>  </span>	
				</div>
				
				<div class="noticebody">
					<table>
						<c:forEach items="${noticeList }" var="notice">
						<tr>
							<td class='noticeTitleTd'><a href="${pageContext.request.contextPath }/notice/read?no=${notice.noticeNo }">${notice.title }</a></td>
							<td><fmt:formatDate value="${notice.regdate }" pattern="yy.MM.dd"/></td>  
						</tr>		
						</c:forEach>
						
					</table>
				</div>
			</div>
			
			<!-- 동영상 -->
			<div class="youtubeWrap">   
				<iframe width="462" height="227" src="https://www.youtube.com/embed/b_3hb97VXwM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>                                                           
			                                                      
		</div>	<!-- noticeInner end -->
	</div>   
</div>