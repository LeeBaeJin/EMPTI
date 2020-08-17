<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>
$(function() {
	//데이터 테이블 입출고일자 역 정렬
	$('#dataTable').DataTable({
		  order: [[1, 'desc']],
		  ordering: true,
		  serverSide: false
	});
	
	$("#releBtn").on('click', function(){
		var td = [];
		var inputQty;
    	$('.checkBox:checked').each(function(idx, item) {
    		var obj = {};
    		var inputQty = prompt("출고 수량을 입력해주세요.", "");
    		//var itemName = $(this).closest('tr').children().eq(4).text();
    		var realQty = $(this).closest('tr').children().eq(6).text();
    		obj['stock_no'] = $(this).closest('tr').children().eq(10).text();
    		obj['strg_no'] = $(this).closest('tr').children().eq(11).text();
    		obj['item_no'] = $(this).closest('tr').children().eq(12).text();	
    		obj['stock_qty'] = $(this).closest('tr').children().eq(5).text();
    		obj['real_qty'] = realQty - inputQty;
    		obj['input_qty'] = inputQty;
    		td.push(obj)
    		
    		console.log(obj);
    		console.log(realQty);		
		});
  
    		var result = confirm("출고하시겠습니까?")
    		if(result) {
    			$.ajax ({
    				url: "setInsertStockRelease",
    				type: "POST",
    				contentType : "application/json",
    				data:  JSON.stringify(td),
    				success: function() {
    					alert("출고 성공")
    					window.location.href="getStocksList"
    				}, error : function() {
    					alert("출고 실패")
    				}
    			}); //ajax
    		} else { 
    			return false;
    		}	
	});//button
});//load


</script>




<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getStocksList">입출고 목록</a> | 
			<a href="setInsertStocks">입고 입력</a> |
			<a href= "stockslist.do" onclick="window.open(this.href, 'width=800', 'height=1200', 'toolbars=no', 'scrollbars=yes'); return false">PDF</a> |
			<a href="stocksexcell.do">EXCEL</a> 
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<a href="getStocksList" class="btn btn-outline-primary">전체내역</a> | 
			<a href="getWarehousingList" class="btn btn-outline-primary">입고내역</a> |
			<a href="getReleaseList" class="btn btn-outline-primary">출고내역</a> <br><br>
			<table class="table table-bordered stockTbl" id="dataTable" style="width: 100%; cellspacing=0;">
				<thead id="tblHead">
					<tr style="text-align: center;">
						<th><input type="checkbox" class="chkAll"></th>
						<th>입출고날짜</th>
						<th>유형</th>
						<th>주문번호</th>
						<th>품목명</th>
						<th>수량</th>
						<th>실수량</th>
						<th>거래처명</th>
						<th>창고</th>
						<th>비고</th>
						<th style="display:none;">입출고번호</th>
						<td style="display:none;">창고번호</td>
						<td style="display:none;">품목코드</td>
						<td style="display:none;">거래처코드</td>
					</tr>
				</thead>
				<tbody id="tblBody">
					<c:forEach items="${stocks}" var="stc">
						<tr>
							
							<td align="center"><input type="checkbox" class="checkBox" value="${stc.stock_no}" <c:if test="${stc.real_qty == 0}">disabled</c:if>
							<c:if test="${stc.stock_category eq '출고'}">disabled</c:if>
							></td>
							
							<td>
								<fmt:parseDate value="${stc.stock_date}" var="fmtDate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${fmtDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${stc.stock_category}</td>
							<c:if test="${stc.stock_category eq '입고'}">
								<td>B_${stc.border_no}</td>
							</c:if>
							<c:if test="${stc.stock_category eq '출고'}">
								<td>R_${stc.release_no}</td>
							</c:if>
							<td>${stc.item_name}</td>
							<td align="right">${stc.stock_qty}</td>
							<td align="right">${stc.real_qty}</td>
							<td>${stc.company_name}</td>
							<td>${stc.strg_category}</td>
							<td>${stc.stock_status}</td>
							<td style="display:none;">${stc.stock_no}</td>
							<td style="display:none;">${stc.strg_no}</td>
							<td style="display:none;">${stc.item_no}</td>
							<td style="display:none;">${stc.company_no}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<button type="button" class="btn btn-success" id="releBtn">출고</button>
