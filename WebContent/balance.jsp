<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}	
	function navigate(){   
	    window.location.replace('http://localhost:8089/HEMBANK/');
	   return false;
	}
	
</script>
<style>
.button {
    background-color: #DFDCE3;
    border: #999999;
    color: #0375B4;
    padding: 2px 3px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 11px;
    margin: 3px 2px;
    cursor: pointer;
}
</style>
</head>

<body>

	<div id="top_links">


		<div id="header">
		<h1>HEM BANK<span class="style1"></span></h1>
	<h2>TRANSCAT SIMPLE</h2>
	<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>
		</div>

		<div id="navigation">
			<ul>
			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
        	<li><a href="http://localhost:8089/HEMBANK/about.jsp">https://www.hembank.se/</a></li>           
            </ul>

					</div>
				</td>

				<td width="1200" valign="top">
					<%
						
					%>
					<table><tr><td><font color="black">
						<%
						try{
							Object accno=session.getAttribute("accountno");						
						    Object usern=session.getAttribute("username");  
						    Object pwd=session.getAttribute("password");  
						    	 String Accn=accno.toString();
						    	 String username=usern.toString();
						    	 String password=pwd.toString();
						    	 System.out.println("ACCN is :::"+Accn);
						
							
								int accountno=Integer.parseInt(Accn);						        
								System.out.println("username and password "+username+"--"+password);
							    //boolean status=verifyLogin1.checkLogin(accountno,username,password);
								
								//if(status==true){
								//	out.print("Welcome    " + username);
								
													
								
							Connection con=GetCon.getCon();
							PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
						            ps.setInt(1,accountno);
							ResultSet rs=ps.executeQuery();
							
							out.print("<table align='left' cellspacing='5' cellpadding='5'>");
								/* 	out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>"); */
							while(rs.next()){
							    int accountno1=rs.getInt(1);
								session.setAttribute("accountno",accountno);
								
								int balance=rs.getInt(6);
								String stringbalance=String.valueOf(balance);
								
								out.print("<tr>");
								out.print("<th> Balance Amount Available:   </th><td style="+"background-color:lightgreen;"+">" +stringbalance+ "</td><th> SEK</th>");
								
								out.print("</tr>");
							
							}
							out.print("</table>");
							
						
							
						%>
					
						<%
							
								 }catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								//}
								
							//}
						%></font></td></tr>
					</table> <%
						
					%>
				
		</table>
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
</body>
</html>

		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>