<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

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
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A> <br>
			<br><br><br>
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
	<a href="/HEMBANK/financialdev.jsp">FINCIALDEV</a>
      
    </div>
  </div> </li>
  
  
   <li><div class="dropdown">
    <button class="dropbtn">USER RELATED
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
<a href="/HEMBANK/userrating.jsp">USER RATING</a>
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



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	        	<li>
<a href="/HEMBANK/quicklinks.html" 
  target="popup" 
  onclick="window.open('/HEMBANK/quicklinks.html','popup','width=600,height=600'); return false ;">
   Quick Links
</a></li></ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
%>
<table><%

		String debitemail="";
		String creditemail="";
    	
		String perNo=(session.getAttribute("perNo")).toString();
		session.setAttribute("perNo", perNo);
	    AccountNumberService ac=new AccountNumberService();
	    int accountno=ac.validate(perNo);
        String bankId=request.getParameter("bankId");
		
		String biller=request.getParameter("billeraccount");
		int billeracc=Integer.parseInt(biller);
		System.out.println("Biller account is "+billeracc);
		
		// amoun is deposit - transfer amount
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
		BankIdService bs=new BankIdService();
	    boolean status=bs.validate(perNo,bankId);

		try {
		if(status==true){
			
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+billeracc+"'");
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(8); 
			creditemail=rs.getString(6);
			}
			String billerName="";
			if(billeracc==1){
				billerName="powerbill";
				
			}else if(billeracc==2){
				billerName="telephonebill";
			}else if(billeracc==3){
				billerName="waterbill";
			}else if(billeracc==4){
				billerName="parkingbill";
			}else if(billeracc==5){
				billerName="Tax";
			}else{
				
			}
			
			Connection con1=GetCon.getCon();			
			PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+billeracc+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			ResultSet rs1=ps1.executeQuery();
		
			if(rs1.next()){}
			System.out.println("data amonut"+dataamount);
			request.setAttribute("target account A ",dataamount);
			Connection con2=GetCon.getCon();
			PreparedStatement ps2=con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps2.setInt(1,accountno);
			ResultSet rs2=ps2.executeQuery();
			
			int dataamount1=0;
			if(rs2.next()){
				// dataamount1 is balance after transcation
			dataamount1=rs2.getInt(8)-accoun; 
			debitemail=rs2.getString(6);
			System.out.println(dataamount1);
			}
			Connection con3=GetCon.getCon();
			
			PreparedStatement ps3=con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			ps3.setInt(1,dataamount1);
			ps3.executeUpdate();
			ResultSet rs3=ps3.executeQuery();
			
			
			// Logic for transcations of transfer amount through online...
			Connection con4=GetCon.getCon();
			
			PreparedStatement ps4=con4.prepareStatement(" insert into transcations  values(?,?,?,?,?,?)");
			java.util.Date today = new java.util.Date();
		    SimpleDateFormat sm = new SimpleDateFormat("MM/dd/yyyy");			  
		    String strDate = sm.format(today);
			    
					ps4.setString(1, strDate);
					
					ps4.setString(2, "Bill Pay to "+billerName);
					ps4.setInt(3, accoun);
					ps4.setInt(4, 0);
					System.out.println("deposit is "+accoun);
					ps4.setInt(5,dataamount1);
					System.out.println("balance is "+dataamount1);
					ps4.setInt(6,accountno);
					System.out.println("accountno is "+accountno);
					
			ps4.executeUpdate();
			//ResultSet rs4=ps1.executeQuery();
			
			
			Connection con5=GetCon.getCon();			
			PreparedStatement ps5=con5.prepareStatement(" insert into transcations  values(?,?,?,?,?,?)");
				
			    
					ps4.setString(1, strDate);
					
					ps4.setString(2, "pay bill");
					ps4.setInt(3, 0);
					ps4.setInt(4, accoun);
					System.out.println("deposit is "+accoun);
					ps4.setInt(5,dataamount);
					System.out.println("balance is "+dataamount1);
					ps4.setInt(6,billeracc);
					System.out.println("accountno is "+billeracc);					
			        ps4.executeUpdate();
			
			        System.out.println("debit email is ::"+debitemail);
			        Main m=new Main();					
			    	m.sendFromGMail("HEM-BANK Billing Transcation notification","Your account bearing with the nmber "+accountno+" has been debited with the amount  "+accoun+" and the Avaialbe balance is "+dataamount1+"."+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",debitemail);
			    	
			    	System.out.println("creditemail email is ::"+creditemail);
			    	Main m1=new Main();					
			    	m1.sendFromGMail("HEM-BANK Billing Transcation notification","Your account bearing with the nmber  "+billeracc+" has been credited with the amount  "+accoun+" and the Avaialbe balance is "+dataamount+"."+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",creditemail);
			    	
			
			if(rs3.next()){
		
			request.setAttribute("target account A",dataamount);
			request.setAttribute("account B",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
			
		}
		else{
			out.print("Please check Bank Security");
			request.setAttribute("balance","Please check Bank Security");
			%>
			<jsp:forward page="paybill1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%></table><%
%>
    	
    	
		 </table>

</div></body></html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
   
