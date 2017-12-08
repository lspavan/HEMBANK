<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
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

		<div id="navigation">
			<ul>
				<li><a href="balance.jsp">VIEW BALANCE</a></li>
				<li><a href="statement.jsp">STATEMENT</a></li>
				<li><a href="emailstatement.jsp">ESTATMENT</a></li>	
				<li><a href="transfer1.jsp">TRANSFER</a></li>
				<li><a href="paybill1.jsp">BILL PAY</a></li>
				<li><a href="financialdev.jsp">FINCIALDEV</a></li>				
				<li><a href="profile.jsp">PROFILE</a></li>
				
			</ul>
		</div>

<%
						try{
							Object accno=session.getAttribute("accountno");						
						    Object usern=session.getAttribute("username");  
						    Object pwd=session.getAttribute("password");  
						    	 String Accn=accno.toString();
						    	 String username=usern.toString();
						    	 String password=pwd.toString();
						    	 System.out.println("ACCN is :::"+Accn);
						    	 int customerId=0;
						    	 int one=1,two=1,three=1,four=1,five=1;
						    	 double average=1.1;
						
							
								int accountno=Integer.parseInt(Accn);						        
								System.out.println("username and password "+username+"--"+password);
								session.setAttribute("accountno",accno);
								
							
								
								%>
							   
							    
							    
								
								<%} 
							
								 }catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								
						%>


		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">
				<p>HEM Bank is the global source of information about and access
					to financial services provided by the HEM group family of
					companies.</p>

				Copyright ?HEM Bank 2017
			</div>
		</div>
	</div>
</body>
</html>