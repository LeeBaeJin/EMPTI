<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getSaleledgerList">장부 내역</a> | 
		<a href="setInsertFormSaleledger">장부 입력</a> |
		<a href="saleledger_list.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>장부번호</th>
						<th>날짜</th>
						<th>금액</th>
						<th>상태</th>
						<th>주문번호</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${saleledgerList}" var="saleledger">
						<tr>
							<td>${saleledger.ldgr_no}</td>
							<td>${saleledger.ldgr_date}</td>
							<td>${saleledger.total_amount}</td>
							<td>${saleledger.condition}</td>
							<td>${saleledger.order_no}</td>
							<td>${saleledger.note}</td>
							<td><a href="setUpdateFormSaleledger?ldgr_no=${saleledger.ldgr_no}">수정</a></td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>