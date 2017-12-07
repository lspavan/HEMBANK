
<html>
<head>



</head>

<body>

<%

		String debitemail="";
		String creditemail="";
    	
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
		
		
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		/* String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1); */
		
		String biller=request.getParameter("billeraccount");
		int billeracc=Integer.parseInt(biller);
		System.out.println("Biller account is "+billeracc);
		
		// amoun is deposit - transfer amount
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
	    boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==true){
			//out.print("Welcome    " + username);
		    out.print("       TARGET ACCOUNT NO DOES NOT EXSIT    " );
		    %>
			<% 
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+billeracc+"'");
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(6); 
			creditemail=rs.getString(9);
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
			dataamount1=rs2.getInt(6)-accoun; 
			debitemail=rs2.getString(9);
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
					
					ps4.setString(2, "Bill Pay");
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
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target acountno");
			%>
			<jsp:forward page="transfer1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {
			e.printStackTrace();
		}
			%>
    	
    	
	</body></html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
   
