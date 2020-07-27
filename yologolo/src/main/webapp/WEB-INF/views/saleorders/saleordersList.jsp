<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getSaleordersList">판매주문 내역 </a> | 
			<a href="setInsertFormSaleorders">판매주문 입력</a> |
			<a href="saleorders_list.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문일자</th>
						<th>판매합계</th>
						<th>배송상태</th>
						<th>사원번호</th>
						<th>입출고 번호</th>
						<th>거래처 코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${saleordersList}" var="saleorders">
						<tr>
						<th>${saleorders.order_no}</th>
						<th>${saleorders.order_date}</th>
						<th>${saleorders.sale_sum}</th>
						<th>${saleorders.del_status}</th>
						<th>${saleorders.emp_id}</th>
						<th>${saleorders.stock_no}</th>
						<th>${saleorders.company_no}</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<!-- 
//	주문번호 order_no -number
//	주문일자	order_date -date
//	판매합계	sale_sum number
//	배송상태	del_status string
//  ---가져오는 data (fk)---
//	사원번호	emp_id (fk) number
//	입출고 번호	stock_no (fk) number
//	거래처 코드	 company_no (fk) number
-->
