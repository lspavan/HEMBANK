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
			<h1>
				HEM BANK<span class="style1"></span>
			</h1>
			<h2>TRANSCAT SIMPLE</h2>

		</div>

		<div id="navigation">
			<ul>


			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px ;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
							<li><a href="#">https://www.hembank.se/</a></li>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top">
					<%
						
					%>
					<table>
						<tr>
							<td><font color="black"> <%
						try{
							 
							String personalNumber=request.getParameter("hiddenperNo");
							String pinCode=request.getParameter("pincode");
							System.out.println("pincode "+pinCode);
							System.out.println("personal number - pincode"+personalNumber+"--"+pinCode);
						    SecurityG3 g=new SecurityG3();
						    personalNumber=g.encrypt(personalNumber,"ssshhhhhhhhhhh!!!!");
						    pinCode=g.encrypt(pinCode,"ssshhhhhhhhhhh!!!!");
							boolean check=false;
													
						
							
							Connection coni=GetCon.getCon();
							PreparedStatement psi;
							try {
								psi = coni.prepareStatement("Insert into ACTIVATION values(?,?,?)");
								int	nextvalue1=GetCon.getPrimaryKey();
								System.out.println("next value is "+nextvalue1);
								psi.setInt(1,nextvalue1);
								psi.setString(2,personalNumber);
								psi.setString(3, pinCode);
								psi.executeUpdate();	
								check=true;
							} catch (Exception e) {								
								e.printStackTrace();
										}
							
							

							
							if(check){%> <jsp:forward page="successactivation.jsp"></jsp:forward> <%}else{%>
									<jsp:forward page="error.jsp"></jsp:forward> <%}
						%> <%
							
								 }catch (Exception e) {
									 System.out.println("catch block");
								 e.printStackTrace();%> <%-- <jsp:forward page="transfer1.jsp"></jsp:forward> --%>
									<%
								}
								
						
						%></font></td>
						</tr>
					</table> <%
						
					%>
				
		</table>
		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">
				<p>HEM Bank is the global source of information about and access
					to financial services provided by the HEM group family of
					companies.</p>

				Copyright © HEM Bank 2015
			</div>
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