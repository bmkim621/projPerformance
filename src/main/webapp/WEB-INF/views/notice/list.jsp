<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css?ada" rel="stylesheet" type="text/css">
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

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

<!-- 공지사항 리스트 -->
<div class="container-fluid tableContainer">
	
	<div class='titleWrapper'>
		<h2 class='text-center'>공지사항</h2><hr>
	</div>
		  

	<div class="table-wrapper">
		<div class="table-filter">
			<div class="row">
			
				<div class="col-sm-12">       
					<div class="filter-group">
						<select name="searchType">
							<option value="t" ${cri.searchType == 't' ? 'selected' : '' }>제목</option>
							<option value="c" ${cri.searchType == 'c' ? 'selected' : '' }>내용</option>
							<option value="tc" ${cri.searchType == 'tc' ? 'selected' : '' }>제목+내용</option>
						</select>
						
						<input type="text" class="form-control" name="keyword" id="keywordInput" value="${cri.keyword }">
						<button type="button" class="btn btn-primary" id="btnSearch"><i class="fa fa-search"></i></button>
					</div>	<!-- filter-group end -->
				</div>
			</div>
		</div>	<!-- table-filter end -->
		
	<table class="table table-striped table-hover">     
		<thead>
			<tr>       
				<th class='firstWrapper'>번호</th>                        
				<th class='twoTh text-center'>제목</th>        
				<th class='threeTh text-center'>작성자</th>
				<th class='fourTh text-center'>작성일</th>						
				<th class='fiveTh text-center'>조회</th>						
			</tr>
		</thead>
		          
		<tbody>
			<c:forEach items="${list }" var="noticeVO" varStatus="status">
				<tr>
				<%-- 	<!-- 번호 -->
					<td>${(pageMaker.totalCount - status.index) - ((pageMaker.cri.page - 1) * pageMaker.displayPageNum)}</td>
					<!-- 번호 끝 -->  --%> 
					<c:if test="${noticeVO.isNotice == '1' }">
						<td class='spanNotice'>알림</td>    
					</c:if>
					<c:if test="${noticeVO.isNotice == '0' }">
						<td class='ondTd'>${noticeVO.noticeNo }</td>
					</c:if>
					<td class='twoTd'><a href='${pageContext.request.contextPath}/notice/read?no=${noticeVO.noticeNo }&page=${pageMaker.cri.page }&searchType=${cri.searchType }&keyword=${cri.keyword }'>${noticeVO.title }</a></td>  
					<td class='threeTd text-center'>${noticeVO.writer }</td>
					<td class='fourTd text-center'><fmt:formatDate value="${noticeVO.regdate }" pattern="yyyy-MM-dd"/></td>  
					<td class='fiveTd text-center'>${noticeVO.viewCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	    
	        <div class="text-center">
                <ul class="pagination justify-content-center">
                	<!-- prev 버튼 달릴 지 판단 -->
                	<c:if test="${pageMaker.prev }">
                		<li class="page-item"><a href="${pageContext.request.contextPath }/notice/list?page=${pageMaker.startPage - 1 }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link"><i class="fas fa-angle-double-left"></i> Previous</a></li>
                	</c:if>
                    <!-- 현재 선택한 페이지 -->
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                    	<li ${pageMaker.cri.page == idx ? 'class="page-item active"' : ''}>
                    	<a href="${pageContext.request.contextPath }/notice/list?page=${idx }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link">${idx }</a>
                    		</li>
                    </c:forEach>
                    <!-- next 버튼 -->
                    <c:if test="${pageMaker.next }">
                    	 <li class="page-item"><a href="${pageContext.request.contextPath }/notice/list?page=${pageMaker.endPage + 1 }&searchType=${cri.searchType }&keyword=${cri.keyword }" class="page-link">Next <i class="fas fa-angle-double-right"></i></a></li>
                    </c:if>        
                </ul>
            </div>         
	
	</div>	<!-- table-wrapper end -->
</div>	<!-- container end -->

<script>
	$(function(){
		//검색버튼
		$("#btnSearch").click(function(){
			//검색 시, 검색종류와 검색어의 값 가져오기
			var searchType = $("select[name='searchType']").val();
			var keyword = $("#keywordInput").val();
			
			location.href = "${pageContext.request.contextPath}/notice/list?searchType=" + searchType + "&keyword=" + keyword;
		})
	})
</script>

<%@ include file="../include/footer.jsp"%>