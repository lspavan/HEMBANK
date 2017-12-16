<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<%
    	 
		String stringbalance="";
		int balance=0;

try {
	Object accno=session.getAttribute("accountno");						
	
    	 String Accn=accno.toString();
    
    	 System.out.println("ACCN is :::"+Accn);

	
		int accountno=Integer.parseInt(Accn);						        
	
	  			
		
	Connection con=GetCon.getCon();
	PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
            ps.setInt(1,accountno);
	ResultSet rs=ps.executeQuery();
	
	while(rs.next()){
	    int accountno1=rs.getInt(1);
		session.setAttribute("accountno",accountno);
		
		balance=rs.getInt(6);
		stringbalance=String.valueOf(balance);
	
		
	
	}
	
	
	} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%>
</body>
</html>