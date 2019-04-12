<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/notice.css?aa" rel="stylesheet" type="text/css">
<!-- lightGallery -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/lightgallery.css" />
<!-- jQuery version must be >= 1.8.0; -->
<script src="${pageContext.request.contextPath }/resources/js/lightgallery.min.js"></script>
<!-- A jQuery plugin that adds cross-browser mouse wheel support. (Optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"></script>
<!-- lightgallery plugins -->
<script src="${pageContext.request.contextPath }/resources/js/lg-fullscreen.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/lg-thumbnail.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/lg-zoom.min.js"></script>
<!-- lightGallery End -->

<style>
div.gInfoWrapper h2 {
	margin-top: 60px;             
	margin-bottom: 40px;  
	letter-spacing: -0.8px;
}

div.galleryWrapper{
	padding: 0;
	text-align: center;
	margin-bottom: 60px;
}

div.gWrapper a{
	overflow: hidden;
	display: inline-block;
	width: 22.5%;                       
	height: 160px;  
	margin-right: 12px;
	margin-bottom: 15px;      
}  

div.gWrapper img{
	width: 100%;
	height: 100%;
	transition: all 0.5s;  
}

div.gWrapper img:hover{  
	transform: scale(1.1) /* 중심을 기준으로 1.1배 확대된다 */  
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

<div class='container galleryWrapper'>
	<div class="row">   
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id='galleryContainer'>   
			<div class='gInfoWrapper'>
				<h2 class='text-center'>갤러리</h2>
			</div>
			
			<div class='gWrapper' id="aniimated-thumbnials">
				<a href='${pageContext.request.contextPath }/resources/upload/img1.jpg' data-sub-html="<h4>2017 오페라 유니버시아드 &#60;코지 판 투테&#62;</h4>">
					<img class="img-responsive" src="${pageContext.request.contextPath }/resources/upload/img1.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img2.jpg" data-sub-html="<h4>오페라스타와의 만남</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img2.jpg" />  
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img3.jpg" data-sub-html="<h4>&#60; 렉처 오페라 리골레토 &#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img3.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img4.JPG" data-sub-html="<h4>2018 기획오페라 &#60; 라 보엠 &#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img4.JPG" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img5.jpg" data-sub-html="<h4>제16회 대구국제오페라축제 &#60; 돈 카를로 &#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img5.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img6.jpg" data-sub-html="<h4>2017. 4. 28 &#60;나비부인&#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img6.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img7.JPG" data-sub-html="<h4>해외진출공연 &#60; 라 보엠 &#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img7.JPG" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img8.jpg" data-sub-html="<h4>최고의 오페라, 최고의 명장면</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img8.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img9.jpg" data-sub-html="<h4>가족오페라 &#60;마술피리&#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img9.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img10.JPG" data-sub-html="<h4>국립발레단 프라임 갈라</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img10.JPG" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img11.jpg" data-sub-html="<h4>오페라유니버시아드 &#60;마술피리&#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img11.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img12.jpg" data-sub-html="<h4>설날엔 오페라하우스에서 놀자</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img12.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img13.jpg" data-sub-html="<h4>2015 앙코르 &#60;투란도트&#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img13.jpg" />
				</a>
				<a href="${pageContext.request.contextPath }/resources/upload/img14.jpg" data-sub-html="<h4>2019 오페라 유니버시아드 &#60;마술피리&#62;</h4>">
					<img src="${pageContext.request.contextPath }/resources/upload/img14.jpg" />
				</a>
			</div>
			
	                        
		</div>
	</div>
</div>

<script>
	$(function(){
		$('#aniimated-thumbnials').lightGallery({
		    thumbnail:true,
		    animateThumb: false,
		    showThumbByDefault: true,	//기본으로 썸네일 화면 보이게 하기
		    zoom: true
		}); 
	})
</script>


<%@ include file="../include/footer.jsp"%>