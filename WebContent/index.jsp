<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}
	function reload(){
		location.reload();
		}
	
</script>


</head>

<body>

	<div id="top_links">
		<div id="header">
			<h1>
				HEM BANK<span class="style1"></span>
			</h1>
			<h2>TRANSCAT SIMPLE</h2>
			<br> <br> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logout.jsp">logout</a>
		</div>

<br>



		<%					System.out.println("Reached");
							String perNo=session.getAttribute("perNo").toString();
							System.out.println("Reached..."+perNo);
							String pinCode=request.getParameter("pincode");
							String lastDate="";
				
			try{		
							
							System.out.println("pincode "+pinCode);
							System.out.println("personal number - pincode"+perNo+"--"+pinCode);
						    SecurityG3 g=new SecurityG3();
						    perNo=g.encrypt(perNo,"ssshhhhhhhhhhh!!!!");
						    pinCode=g.encrypt(pinCode,"ssshhhhhhhhhhh!!!!");
							boolean check=false;
													
						    NewLoginCheck nl=new NewLoginCheck();
						    check=nl.login(perNo, pinCode);
						   
						
						    LOGINTRANSCATIONS lt=new LOGINTRANSCATIONS();
						    lastDate=lt.getTranscat(perNo);
						    lt.loginTranscat(perNo);
							if(check){
								
							}							
							else {
								out.println("Please check credentals");
								request.setAttribute("accountdetails",
										"\n"+"Credentials you have provided are wrong..");%>
										<jsp:forward page="login.jsp"></jsp:forward>
							<%}
						%>
		 


		<input type="hidden" name="hiddenperNo" value="<%=perNo%>" />
		<%
							
								 }catch (Exception e) {
									 System.out.println("catch block");
								 e.printStackTrace();%>
		<%
								}
								
						
						%>


			<div id="navigation">
				<ul>
				
				

				
					<%
							if (perNo.equals("mHAahNKa+FFH8T0CqKtqXA==")) {
						%>
					<li><a href="/HEMBANK/create.html">REGISTRATION</a><q/li>
					<li><a href="/HEMBANK/searchreactive.jsp">REACTIVATE</a></li>
					<li><a href="/HEMBANK/deposit1.jsp">DEPOSIT</a></li>
					<%
							} else {
						%>


					<li><a href="/HEMBANK/balance.jsp">GET FUNDS</a></li>
					<li><a href="/HEMBANK/managefunds.jsp">MANAGE FUNDS</a></li>
					<li><a href="/HEMBANK/userrelated.jsp">USER RELATED</a></li>
					<li><a href="/HEMBANK/about.jsp">ABOUT US</a></li>					


					<%
							}
						%>

				</ul>



			</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" height="150" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
							<li>
<a href="/HEMBANK/quicklinks.html" 
  target="popup" 
  onclick="window.open('/HEMBANK/quicklinks.html','popup','width=600,height=600'); return false ;">
   Quick Links
</a></li>                   <%if(!lastDate.equals(null) || !lastDate.equals("")){ %>
							<li><span style="color:blue;"> last logged in <%=lastDate %></span></li>
							<%} %>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top"><font color="black"> <%
 	
 %>
						
							<%
									try {
										Connection con1 = GetCon.getCon();
									
										session.setAttribute("perNo", perNo);
									
										PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from NEWACCOUNT where personalnumber='"+perNo+"'");
										
										ResultSet rs1 = ps1.executeQuery();
										while (rs1.next()) {
											int accountno = rs1.getInt(1);
											request.setAttribute("accountno", accountno);
										}
										Integer accountno = (Integer) request.getAttribute("accountno");
										Connection con = GetCon.getCon();
										PreparedStatement ps = con
												.prepareStatement("Select * from NEWACCOUNT where accountno='"
														+ accountno + "'");
										System.out.println("Interger converted one:::" + accountno);
										// ps.setInt(1,accountno);
										ResultSet rs = ps.executeQuery();

										out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
										/* out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>BLANCE</th><th>ADDRESS</th><th>PHONE</th></tr>"); */
										while (rs.next()) {

											session.setAttribute("accountno", accountno);

											System.out.print(accountno);
											out.print("<tr>");
											out.print("<th> Welcome  </th><td>" + rs.getString(3)
													+ "</font></td>");

								%>



							<%
									out.print("</tr>");

										}
										out.print("</table>");

										
									} catch (SQLException e) {
										e.printStackTrace();
									}
								%>
						</table> <%
 	
 %>
		

		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">
				<p>HEM Bank is the global source of information about and access
					to financial services provided by the HEM group family of
					companies.</p>

				Copyright © HEM Bank 2015
			</div>

			<script type="text/javascript">
					document.onload = ctck();
				</script>
		</div></div>
</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*"%>