<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*"%>

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

	

	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {

			var data = google.visualization.arrayToDataTable([
					[ 'Task', 'Hours per Day' ], [ 'WITHDRAWL',  <%=draw%>],
					[ 'DEPOSIT',  <%=dep%>] ]);

			var options = {
				title : 'Your Transcations Advice'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>