<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
function navigate(){ 
	window.history.forward();
	window.history.go(-2);
    window.location.replace('http://localhost:8089/HEMBANK/');
   return false;
}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
<h1>HEM BANK<span class="style1"></span>
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
 <ul>
 <li><a href="/HEMBANK/create.html">REGISTRATION</a></li>					
<li><a href="/HEMBANK/deposit1.jsp">DEPOSIT</a></li>
 
 </ul>
    
    
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.hembank.se</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    <h2><p><span style="color:blue">Amount has been deposited..</span></p></h2>
    	
    	<% 
%>
<table><%
	     String email="";
    	 String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);

		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
	   // boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
	
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(8); 
			email=rs.getString(6);
			}
			Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			ResultSet rs1=ps1.executeQuery();
			
			
			
			
			Connection con5=GetCon.getCon();			
			PreparedStatement ps4=con5.prepareStatement(" insert into transcations  values(?,?,?,?,?,?)");
			java.util.Date today = new java.util.Date();
		    SimpleDateFormat sm = new SimpleDateFormat("MM/dd/yyyy");			  
		    String strDate = sm.format(today);
			    
					ps4.setString(1, strDate);					
					ps4.setString(2, "Cash deposited through Bank");
					ps4.setInt(3, 0);
					ps4.setInt(4, accoun);
					System.out.println("deposit is "+accoun);
					ps4.setInt(5,dataamount);
					System.out.println("balance is "+dataamount);
					ps4.setInt(6,accountno);
					System.out.println("accountno is "+accountno);					
			        ps4.executeUpdate();
			
			
			        Main m=new Main();					
			    	m.sendFromGMail("HEM-BANK online transfer Transcation notification","Your account bearing with the nmber "+accountno+" has been debited with the amount  "+accoun+" and the Avaialbe balance is "+dataamount+"."+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",email);
			
			
			
			if(rs1.next()){
			out.print("Balance has increase");
			request.setAttribute("totaldataamount",dataamount);
			request.setAttribute("balance","Balance has increased to  ");	
			%>
			<jsp:forward page="adminbalance.jsp"></jsp:forward> 
			<% 
			}
			

		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>




   
