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

						<li><a href="paybill1.jsp">BILL PAY</a></li>
						<li><a href="financialdev.jsp">FINCIALDEV</a></li>			   	
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
</a></li>
            
            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
    	String perNo=(session.getAttribute("perNo")).toString();
    	session.setAttribute("perNo", perNo);
%>
<table><%
    	String debitemail="";
	    String creditemail="";
	    boolean targetAcStatus=false;
	    
	    
	    AccountNumberService ac=new AccountNumberService();
	    int accountno=ac.validate(perNo);
	 
		
		
        
        String bankId=request.getParameter("bankId");		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		// amoun is deposit - transfer amount
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
		System.out.println("Before sending values to Bankid service "+perNo+"--"+bankId);
		BankIdService bs=new BankIdService();
	    boolean status=bs.validate(perNo,bankId);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==false){
			
			out.print("Please check Bank Security");
			request.setAttribute("balance","Please check Bank Security");
		}else if(taccountno==accountno){
			out.print("You can't deposit to own account");
			request.setAttribute("balance","You can't deposit to own account");
		}else if(status==true && taccountno!=accountno){
			
		    %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href='index.html'><IMG SRC='images/home1.gif'></IMG></A>
			<% 
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+taccountno+"'");
			System.out.println("Target Account number is:::"+taccountno);
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
				targetAcStatus=true;
			dataamount=accoun+rs.getInt(8); 
			creditemail=rs.getString(6);
			System.out.println("credit email is "+creditemail);
			}
			Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+taccountno+"'");
			System.out.println("Target account number remaining balance:::"+taccountno+"Balence:::"+dataamount);
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			ResultSet rs1=ps1.executeQuery();
		
			if(rs1.next()){}
			System.out.println("data amonut"+dataamount);
			request.setAttribute("target account A ",dataamount);
			Connection con2=GetCon.getCon();
			PreparedStatement ps2=con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			System.out.println("Current accunt number:::"+accountno);
            ps2.setInt(1,accountno);
			ResultSet rs2=ps2.executeQuery();
			
			int dataamount1=0;
			if(rs2.next()){
				// dataamount1 is balance after transcation
			dataamount1=rs2.getInt(8)-accoun; 
			debitemail=rs2.getString(6);
			System.out.println("current account number balance after debit"+dataamount1);
			System.out.println("debit email is "+debitemail);
			}
			Connection con3=GetCon.getCon();
			
			PreparedStatement ps3=con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			System.out.println("Fourth prepared statement:::"+accountno+":::balance:::"+dataamount1);
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
					System.out.println("date is "+strDate);
					ps4.setString(2, "online by "+taccountno);
					ps4.setInt(3, accoun);
					ps4.setInt(4, 0);
					System.out.println("Withdral or deposit amount is  "+accoun);
					ps4.setInt(5,dataamount1);
					System.out.println("balance is "+dataamount1);
					ps4.setInt(6,accountno);
					System.out.println("accountno is "+accountno);					
			        ps4.executeUpdate();
			//ResultSet rs4=ps1.executeQuery();
			
			Connection con5=GetCon.getCon();			
			PreparedStatement ps5=con5.prepareStatement(" insert into transcations  values(?,?,?,?,?,?)");
			
			    
					ps5.setString(1, strDate);
					
					ps5.setString(2, "online by "+accountno);
					ps5.setInt(3, 0);
					ps5.setInt(4, accoun);
					System.out.println("deposit is "+accoun);
					ps5.setInt(5,dataamount);
					System.out.println("balance is "+dataamount1);
					ps5.setInt(6,taccountno);
					System.out.println("accountno is "+taccountno);					
					ps5.executeUpdate();
			
			
			        Main m=new Main();					
			    	m.sendFromGMail("HEM-BANK online transfer Transcation notification","Your account bearing with the nmber "+accountno+" has been debited with the amount  "+accoun+" and the Avaialbe balance is "+dataamount1+"."+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",debitemail);
			    	
			
			    	Main m1=new Main();					
			    	m1.sendFromGMail("HEM-BANK online transfer Transcation notification","Your account bearing with the nmber  "+taccountno+" has been credited with the amount  "+accoun+" and the Avaialbe balance is "+dataamount+"."+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",creditemail);
			    	
			    	
			if(rs3.next()){
		
			request.setAttribute("target account A",dataamount);
			request.setAttribute("account B",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
			
		}
		else{
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check target acountno");
			%>
			<jsp:forward page="transfer1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%></table><%
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

</div></body></html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>


   
s