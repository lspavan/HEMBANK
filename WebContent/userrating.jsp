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
		window.history.forward();
		window.history.go(-2);
	    window.location.replace('http://localhost:8089/HEMBANK/');
	   return false;
	}
	
	function dil(rate){		
		if(document.usrrateform.rating.value=='select'){
			alert("Please select one rating option before you proceed");
			return false;
		}else{
			var value=document.usrrateform.rating.value;
			return true;
		}
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
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A> <br>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logout.jsp" >logout</a>
		</div>

		<div id="navigation">
			<ul><li><div class="dropdown">
    <button class="dropbtn">GET FUNDS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     <a href="/HEMBANK/balance.jsp">BALANCE</a>
      <a href="statement.jsp">STATEMENT</a>
				<a href="emailstatement.jsp">ESTATMENT</a>
      
    </div>
  </div> </li>
  
  
  
 <li><div class="dropdown">
    <button class="dropbtn">MANAGE FUNDS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <a href="/HEMBANK/transfer1.jsp">TRANSFER</a>
	<a href="/HEMBANK/paybill1.jsp">BILL PAY</a>
	<a href="/HEMBANK/financialdev.jsp">FINCIALDEV</a>
      
    </div>
  </div> </li>
  
  
   <li><div class="dropdown">
    <button class="dropbtn">USER RELATED
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
<a href="/HEMBANK/profile.jsp">PROFILE</a>
      
    </div>
  </div> </li>
   <li><div class="dropdown">
    <button class="dropbtn">ABOUT US
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
<a href="/HEMBANK/about.jsp">ABOUT US</a>      
    </div>
  </div> </li>
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
							<li>
<a href="/HEMBANK/quicklinks.html" 
  target="popup" 
  onclick="window.open('/HEMBANK/quicklinks.html','popup','width=600,height=600'); return false ;">
   Quick Links
</a></li>
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
							String perNo=(session.getAttribute("perNo")).toString();
							session.setAttribute("perNo", perNo);
						    AccountNumberService ac=new AccountNumberService();
						    int accountno=ac.validate(perNo);
						    session.setAttribute("accountno", accountno);
						    System.out.println("ACCN is :::"+accountno);
						    	 int customerId=0;
						    	 int one=1,two=1,three=1,four=1,five=1;
						    	 double average=1.1;
						
							
								
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
							    Thanks for your openion... <br> <br>
							    <table border=1 align=center>							    
							    <tr><td><span style="color:blue;"> Current Rating is: </span>&nbsp;&nbsp;<b>
							    
							    <%out.print(twoDForm.format(average));%></b>
							    
							    </td></tr>
							    
							    </table>
								
								
								<%}else{%>
							<form name="usrrateform" id="usrform" onSubmit="return dil(this)" action="ratingupdate.jsp">
							<table border="1" align="center"><tr><td>
							<span style="color:black;"> Please provide your rating below: </span><br><br>
										<select name="rating">
											<option value="select">Select</option>
											<option value="five">5-Excellent</option>
											<option value="four">4-Good</option>
											<option value="three">3-Average</option>
											<option value="two">2-Need Improvement</option>
											<option value="one">1-Poor</option>
										</select></td></tr>
							<br>
							<tr><td>
							<textarea rows="4" cols="50" name="comment" >Enter comments here...</textarea>

							</td></tr>
							<tr><td>
							<input type="submit" name="Submit" value=" Submit Rating "></td></tr></table>

									</form>
							
							<%}
						
							
						
							
						%> <%
							
								 }catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								//}
								
							//}
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
<%@ page import="java.text.DecimalFormat"%>
