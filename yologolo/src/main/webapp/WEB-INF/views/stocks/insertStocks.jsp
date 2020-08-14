<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	label{display:inline-block; width:100px;}
</style>
<script>
	$(function() {
		stocksList();
	});
	
	function stocksList() {
		<%--$.ajax({
			url:'',
			data: ,
			type: 'GET',			
			dataType: 'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:stocksListResult
		});--%>
	}// 리스트 조회
	
	function stocksListResult(data) {
		$("tblBody").empty();
		$.each(data, function(idx, item){
			$('<tr>')
			.append($('<td>').html(item.border_date))
			.append($('<td>').html(item.item_name))
			.append($('<td>').html(item.stock_qty))
			.append($('<td>').html(item.strg_category))
			.appendTo('tblBody');
		});//each
	}//userListResult
</script>
<div class="col-sm-12 my-auto">
	<h2 class="display-4 text-dark" style=font-size:35px;>입고 입력</h2>
	<hr class="sidebar-divider d-none d-md-block" width="40%" align="left"> 
	<form action="" id="stockFrm">
		<label>입고 번호</label>	<input value="" type="text" name="stock_no" class="form-control" style="width: 130px; display: inline;" readonly="readonly"><br/>
		<label>입고 일자</label>	<input value="${serverTime}" type="datetime-local" name="stock_date" class="form-control" style="width: 260px; display: inline;"><br/>
		<label>유형</label>		<input value="입고" name="stock_category" class="form-control" style="width: 80px; display: inline;" readonly="readonly"><br/>
		<label>주문 조회</label>	<input name="border_no" id="border_no" class="form-control" style="width: 100px; display: inline;">
								<button type="button" value="" id="" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" height="30px"></button>
								<br/><br/>
								
		<table border="1" id="orderTable" class="table table-bordered" style="width: 40%;">
			<thead>
				<tr>
					<th>주문날짜</th>
					<th>품목명</th>
					<th>수량</th>
					<th>창고</th>
					<th style="display: none;">주문번호</th>
				</tr>
			</thead>
			<tbody id="tblBody"></tbody>
		</table>						
		<button type="button" id="insertBtn" class="btn btn-success">입력</button>
		<button type="button" id="resetBtn" class="btn btn-warning">초기화</button>								
	</form>
</div>