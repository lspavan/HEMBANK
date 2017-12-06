<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
			<%@ page import="java.io.*"%>
			<%@ page import="javax.servlet.*"%>
			<%@ page import="g.*"%>
<html>
<head>

<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
function navigate() {
	window.history.forward();
	window.history.go(-100);
	window.location.replace('http://localhost:8089/HEMBANK/');
	return false;
}
</script>

</head>

<body>

	<div id="top_links">


		<div id="header">
			<h1>HEM BANK<span class="style1"></span></h1>
	<h2>TRANSCAT SIMPLE</h2>
	<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>
			<br><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logout.jsp" >logout</a>

		<div id="navigation">
			<ul>
				<li><a href="balance.jsp">VIEW BALANCE</a></li>				
				<li><a href="emailstatement.jsp">ESTATMENT</a></li>	
				<li><a href="transfer1.jsp">TRANSFER</a></li>
				<li><a href="paybill1.jsp">BILL PAY</a></li>
				<li><a href="financialdev.jsp">FINCIALDEV</a></li>
				<li><a href="userrating.jsp">USER RATING</a></li>
				<li><a href="profile.jsp">PROFILE</a></li>

			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>


				<td width="1200" valign="top">
					<% 
%> <!-- checking the passed values --> <%Object accno=session.getAttribute("accountno");
    	
    	/* out.println("object value is :::"+accno.toString());
    	 out.println("value is "+session.getAttribute("accountno")); */
    	 
    	 String Accn=accno.toString();
    	 System.out.println("ACCN is :::"+Accn);
    	 
    	 %>



					<table>
						<%

try {
		    Connection con1=GetCon.getCon();			
			PreparedStatement ps1=con1.prepareStatement("Select * from TRANSCATIONS WHERE accountno= "+accno.toString() +" order by TRANSCATDATE desc");
			//PreparedStatement ps1=con1.prepareStatement("Select accountno from NEWACCOUNT where accountno='"+passedaccountno+"'");
          
            ResultSet rs1=ps1.executeQuery();
            System.out.println("After result set");
         /*    while(rs1.next()){
				int  accountno=rs1.getInt(6);
				request.setAttribute("accountno",accno.toString());
				} */
		
        
			
			out.print("<table align='left'  cellspacing='6' cellpadding='6'>");
				
			out.print("<tr><th>ACCOUNTNo</th><th>TRANSCATIONDATE</th><th>NARRATION</th><th>WITHDRAWL</th><th>DEPOSIT</th><th>BALANCE</th></tr>");
			
			while(rs1.next()){				
				out.print("<tr>");
				out.print("<td> <font color='black'>" + rs1.getInt(6) + "</font></td>");				
				out.print("<td> <font color='black'>" + rs1.getString(1) + "</font></td>");
				out.print("<td> <font color='black'>" + rs1.getString(2) + "</font></td>");				
				out.print("<td> <font color='black'>" + rs1.getInt(3) + "</font></td>");
				out.print("<td> <font color='black'>" + rs1.getInt(4) + "</font></td>");
				out.print("<td> <font color='black'>" + rs1.getInt(5) + "</font></td>");
								
				
				//out.print("<td><a href='DeleteServlet' >Delete</a></td>");
				session.setAttribute("accountno",rs1.getInt(6));
			    
				out.print("</tr>");
			    
			}
			
			out.print("</table>");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%>
					</table> <%
%>
				
		</table>

<br><br>
		<jsp:include page="pi.jsp" flush="true">
			<jsp:param name="accno" value="${Accn}" /> 
  
			</jsp:include>
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
    <div id="footer_copyright" >
		    <p>HEM Bank is the global source of information about and access to financial services provided by the HEM group family of companies.</p>
	  
  Copyright © HEM Bank 2015</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>
</body></html>

			