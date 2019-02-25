<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- 내가 만든 css 파일 -->
<link href="${pageContext.request.contextPath }/resources/css/notice.css" rel="stylesheet" type="text/css">
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
<div class="container">
	<div class="table-wrapper">
		<div class="table-filter">
			<div class="row">
				<div class="col-sm-12">
					<button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
					
					<div class="filter-group">
						<label>제목</label>
						<input type="text" class="form-control">
					</div>	<!-- filter-group end -->
				</div>
			</div>
		</div>	<!-- table-filter end -->
		
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>Customer</th>
				<th>Location</th>
				<th>Order Date</th>						
				<th>Status</th>						
				<th>Net Amount</th>
				<th>Action</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>1</td>
				<td><a href="#">Michael Holz</a></td>
				<td>London</td>
				<td>Jun 15, 2017</td>                        
				<td><span class="status text-success">&bull;</span> Delivered</td>
				<td>$254</td>
				<td><a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
			</tr>
		
			<tr>
				<td>2</td>
				<td><a href="#">Paula Wilson</a></td>
				<td>Madrid</td>                       
				<td>Jun 21, 2017</td>
				<td><span class="status text-info">&bull;</span> Shipped</td>
				<td>$1,260</td>
				<td><a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
			</tr>
		
			<tr>
				<td>3</td>
				<td><a href="#">Antonio Moreno</a></td>
				<td>Berlin</td>
				<td>Jul 04, 2017</td>
				<td><span class="status text-danger">&bull;</span> Cancelled</td>
				<td>$350</td>
				<td><a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>                        
			</tr>
		
			<tr>
				<td>4</td>
				<td><a href="#">Mary Saveley</a></td>
				<td>New York</td>
				<td>Jul 16, 2017</td>						
				<td><span class="status text-warning">&bull;</span> Pending</td>
				<td>$1,572</td>
				<td><a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
			</tr>
		
			<tr>
				<td>5</td>
				<td><a href="#">Martin Sommer</a></td>
				<td>Paris</td>
				<td>Aug 04, 2017</td>
				<td><span class="status text-success">&bull;</span> Delivered</td>
				<td>$580</td>
				<td><a href="#" class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
			</tr>
		</tbody>
	</table>
	
	<div class="clearfix">
		<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
		
		<ul class="pagination">
			<li class="page-item disabled"><a href="#">Previous</a></li>
			<li class="page-item active"><a href="#" class="page-link">1</a></li>
			<li class="page-item"><a href="#" class="page-link">2</a></li>
			<li class="page-item"><a href="#" class="page-link">3</a></li>
			<li class="page-item"><a href="#" class="page-link">4</a></li>
			<li class="page-item"><a href="#" class="page-link">5</a></li>
			<li class="page-item"><a href="#" class="page-link">6</a></li>
			<li class="page-item"><a href="#" class="page-link">7</a></li>
			<li class="page-item"><a href="#" class="page-link">Next</a></li>
		</ul>
	</div>	<!-- clearfix end -->
	</div>	<!-- table-wrapper end -->
</div>	<!-- container end -->
<h1>${list }</h1>

<%@ include file="../include/footer.jsp"%>