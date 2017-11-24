<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


</head>

<body>

					<table><tr><td><font color="black">
						<%
						try{
							Object accno=session.getAttribute("accountno");						
						    Object usern=session.getAttribute("username");  
						    Object pwd=session.getAttribute("password");  
						    	 String Accn=accno.toString();
						    	 String username=usern.toString();
						    	 String password=pwd.toString();
						    	 System.out.println("ACCN is :::"+Accn);
						
							
								int accountno=Integer.parseInt(Accn);						        
								System.out.println("username and password "+username+"--"+password);
							    //boolean status=verifyLogin1.checkLogin(accountno,username,password);
								
								//if(status==true){
								//	out.print("Welcome    " + username);
								
													
								
							
						%>
					
						<%
							
								 }catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								//}
								
							//}
						%></font></td></tr>
					</table> 
</body>
</html>

		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>