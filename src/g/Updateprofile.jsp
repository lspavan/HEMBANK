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
</script>

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
        	<li><a href="#">https://www.hembank.se/</a></li>           
            </ul>

					</div>
				</td>

				<td width="1200" valign="top">
					<%
						
					%>
					<table><tr><td><font color="black">
						<%
						try{
							 String phone=request.getParameter("phone");
							 int ph=0;
							 if(!phone.equals("")){
								 ph=Integer.parseInt(phone);
							 }
								 String email=request.getParameter("email");
								 String query="";
								 
								 if(email.contains("@") && (!email.equals(null) || !email.equals("")) && (!phone.equals(null) || !phone.equals(""))){
									  query="update NEWACCOUNT set phone="+ph+",email='"+email+"' where accountno=?";
								 }else if(email.contains("@") && (!email.equals(null) || !email.equals("")) && (phone.equals(null) || phone.equals(""))){
									  query="update NEWACCOUNT set email='"+email+"' where accountno=?";
								 
								 }else if((email.equals(null) || email.equals("")) && (!phone.equals(null) || !phone.equals(""))){
									 query="update NEWACCOUNT set phone="+phone+ "where accountno=?";
											 }else{
											 }
								
								System.out.println("Query is "+query);
								if(!query.equals("")){
							Object accno=session.getAttribute("accountno");						
						     
						    	 String Accn=accno.toString();
						    	 
						    	 System.out.println("ACCN is :::"+Accn);
						
							
								int accountno=Integer.parseInt(Accn);						        
								
							
								
								//if(status==true){
								//	out.print("Welcome    " + username);
								
													
								
							Connection con=GetCon.getCon();
							PreparedStatement ps=con.prepareStatement(query);
						            ps.setInt(1,accountno);
							ResultSet rs=ps.executeQuery();
							
							session.setAttribute("accountno",accountno);
								/* 	out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>"); */
							/* while(rs.next()){
							    int accountno1=rs.getInt(1);
								session.setAttribute("accountno",accountno);
								//String fulName=rs.getString(2);
							} */
							}%>
							<jsp:forward page="profile.jsp"></jsp:forward> 
								 <%}catch (SQLException e) {
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

