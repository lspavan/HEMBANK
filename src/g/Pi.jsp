<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*"%>

<html>
<body>
<%
int draw = 0;
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



</body>
</html>