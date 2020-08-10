<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <style>
	label{display:inline-block; width:80px;}
</style>
<script>
var emp_select_value = function(select_obj) {
	if($("#emp_id").text() == ""){
	$("#emp_id").val(select_obj.value);
	}
	else {
	$("#emp_id").empty();
	$("#emp_id").val(select_obj.value);
	}	
}

</script>  
    
<div >
	<h2 class="display-4 text-dark"  style=font-size:30px>부서 수정</h2>
	<form action="setUpdateDept" class="from-group">
		<label>부서번호</label>	 <input name="dept_id" value="${deptUp.dept_id}" readonly> <br/>
		<label>부서이름</label>	 <input name="dept_name" value="${deptUp.dept_name}"> <br/>
		<label>매니저</label>	 	<%-- <input name="emp_id" value="${deptUp.name}"> <br/> --%>
								<select name="emp_id" onchange="emp_select_value(this);">
									<option value="${deptUp.emp_id}" selected> ${deptUp.name}</option>
									<option >--------------</option>
									<c:forEach items="${empList}" var="emp">
										<option value="${emp.emp_id}">${emp.name}</option>
									</c:forEach>
								</select>
								
								<input id="emp_id" value="${deptUp.emp_id}"> <br/> 
		<button class="btn btn-primary"type="submit">수정</button>
	</form>
</div>