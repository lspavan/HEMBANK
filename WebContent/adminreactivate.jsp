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
<%
String loc="";
String perNo=(session.getAttribute("perNo")).toString();
System.out.println("received from session "+perNo);
session.setAttribute("perNo", perNo);
loc=request.getParameter("sperno");
session.setAttribute("sperno", loc);
//System.out.println("search perno is "+sp); 

SecurityG3 g3=new SecurityG3();
String decPerNo=g3.encrypt(loc,"ssshhhhhhhhhhh!!!!");
    	 
    	 %>
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
			<a href="logout.jsp" >logout</a></div><br>

		<div id="navigation">
		
			<ul>
					<li><a href="/HEMBANK/create.html">REGISTRATION</a></li>					
					<li><a href="/HEMBANK/deposit1.jsp">DEPOSIT</a></li>

			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>


				<td width="1200" valign="top">
					
					<table>
						<%

try {
		    Connection con1=GetCon.getCon();			
			PreparedStatement ps1=con1.prepareStatement("Select * from NEWACCOUNT WHERE personalnumber='"+decPerNo +"'");
			ResultSet rs1=ps1.executeQuery();
		
        
			
			out.print("<table align='left'  cellspacing='6' cellpadding='6'>");				
			out.print("<tr><th>ACCOUNTNo</th><th>FULL NAME</th><th>STATUS</th><th>ACTION</th></tr>");
			
			while(rs1.next()){		
				String temp=rs1.getString(7);
				out.print("<tr>");
				out.print("<td> <font color='black'>" + rs1.getInt(1) + "</font></td>");				
				out.print("<td> <font color='black'>" + rs1.getString(3) + "</font></td>");
				out.print("<td> <font color='black'>" + rs1.getString(7) + "</font></td>");
				out.print("<td> <font color='black'>"); %>
				<a href="reactivate.jsp">REACTIVATE</a>
			    
			    
				<%
				out.print("</font></td>");
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
		
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
    <div id="footer_copyright" >
		    <p>HEM Bank is the global source of information about and access to financial services provided by the HEM group family of companies.</p>
	  
  Copyright © HEM Bank 2015</div>
</div></div>

<script type="text/javascript">
document.onload = ctck();
</script>

</body></html>

			