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

	<%int draw = 0;
	int dep = 0;
	
		try {

			Object accno = session.getAttribute("accountno");
			System.out.println("accno in pie" + accno.toString());
			Connection con1 = GetCon.getCon();
			PreparedStatement ps1 = con1
					.prepareStatement("Select * from TRANSCATIONS where accountno= "
							+ accno.toString());
			//PreparedStatement ps1=con1.prepareStatement("Select accountno from NEWACCOUNT where accountno='"+passedaccountno+"'");

			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				
				int withdrawl = rs1.getInt(3);
				draw = draw + withdrawl;
				
				int deposit = rs1.getInt(4);
				dep = dep + deposit;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	%>

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