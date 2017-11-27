<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>

<body>

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
								
													
								
							Connection con=GetCon.getCon();
							PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
						            ps.setInt(1,accountno);
							ResultSet rs=ps.executeQuery();
							
							out.print("<table align='left' cellspacing='5' cellpadding='5'>");
								/* 	out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>"); */
							while(rs.next()){
							    int accountno1=rs.getInt(1);
								session.setAttribute("accountno",accountno);
								
								int balance=rs.getInt(6);
								String stringbalance=String.valueOf(balance);
								
								out.print("<tr>");
								out.print("<th> Balance Amount Available:   </th><td style="+"background-color:lightgreen;"+">" +stringbalance+ "</td><th> SEK</th>");
								
								out.print("</tr>");
							
							}
							out.print("</table>");
							
						
							
						%>
					
						<%
							
								 }catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								
								
							
						%>
					
				
		
</body>
</html>

		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>