<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
  <!-- 부서별 사원 수 차트 시작 -->
    <script type="text/javascript">
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);

	  function drawChart() {
	
	    var data = new google.visualization.DataTable();
	    data.addColumn('String', 'Month');
	    data.addColumn('number', 'Guardians of the Galaxy');
	    data.addColumn('number', 'The Avengers');
	    data.addColumn('number', 'Transformers: Age of Extinction');
	
	    data.addRows([
	      [1,  37.8, 80.8, 41.8],
	      [2,  30.9, 69.5, 32.4],
	      [3,  25.4,   57, 25.7],
	      [4,  11.7, 18.8, 10.5],
	      [5,  11.9, 17.6, 10.4],
	      [6,   8.8, 13.6,  7.7],
	      [7,   7.6, 12.3,  9.6],
	      [8,  12.3, 29.2, 10.6],
	      [9,  16.9, 42.9, 14.8],
	      [10, 12.8, 30.9, 11.6],
	      [11,  5.3,  7.9,  4.7],
	      [12,  6.6,  8.4,  5.2],
	      [13,  4.8,  6.3,  3.6],
	      [14,  4.2,  6.2,  3.4]
	    ]);
	
	    var options = {
	      chart: {
	        title: 'Box Office Earnings in First Two Weeks of Opening',
	        subtitle: 'in millions of dollars (USD)'
	      },
	      width: 900,
	      height: 500
	    };
	
	    var chart = new google.charts.Line(document.getElementById('linechart_material'));
	
	    chart.draw(data, google.charts.Line.convertOptions(options));
	  }
    </script>
    <!-- Line Chart -->
	<div class="card shadow mb-4" style="width: 30%;">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
		</div>
		<div class="card-body" style="width: 30%;">
			<div class="chart-area" style="width: 30%;">
				<canvas id="myAreaChart"></canvas>
			</div>
		</div>
	</div>