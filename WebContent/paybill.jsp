
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
			
			
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
			
		}
	
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%></body></html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
   
