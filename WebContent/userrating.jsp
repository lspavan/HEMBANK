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
								
							Connection con=GetCon.getCon();
							PreparedStatement ps=con.prepareStatement("Select * from ratedcustomer where customerId=?");
						            ps.setInt(1,accountno);
							ResultSet rs=ps.executeQuery();
							System.out.println("after execute query");
							while(rs.next()){
								   
								customerId=rs.getInt(1);
								//String stringbalance=String.valueOf(balance);						
							}
							rs.close();
							System.out.println("customer id - accountno "+customerId+"--"+accountno);
							if(customerId==accountno){
								Connection con1=GetCon.getCon();
								PreparedStatement ps1=con1.prepareStatement("Select * from rating");							            
								ResultSet rs1=ps1.executeQuery();								
								while(rs1.next()){
									   one=rs1.getInt(1);									  
									   two=rs1.getInt(2);									   
									   three=rs1.getInt(3);									   
									   four=rs1.getInt(4);									   
									   five=rs1.getInt(5);									   
									   System.out.print(one+"--"+two+"--"+three+"--"+four+"--"+five);
															
								}			
								
								average=((five*5)+(four*4)+(three*3)+(two*2)+(one*1));
								System.out.println(average);
								average=average/(one+two+three+four+five);
								 DecimalFormat twoDForm = new DecimalFormat("#.00");
								
								%>
								 <%out.print(twoDForm.format(average));%></b>
								 <%}else{%>
								 
								 
								 
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

				Copyright ?HEM Bank 2015
			</div>
		</div>
	</div>
</body>
</html>