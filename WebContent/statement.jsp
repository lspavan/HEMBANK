<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
			<%@ page import="java.io.*"%>
			<%@ page import="javax.servlet.*"%>
			<%@ page import="g.*"%>
<html>
<head>




<body>

<jsp:include page="pi.jsp" flush="true">
			<jsp:param name="accno" value="${Accn}" /> 
  
			</jsp:include>
	
 <%
 Object accno=session.getAttribute("accountno");
    	
    
    	 
    	 String Accn=accno.toString();
    	 System.out.println("ACCN is :::"+Accn);
    	 
    	 %>



				
						<%

try {
		    Connection con1=GetCon.getCon();			
			PreparedStatement ps1=con1.prepareStatement("Select * from TRANSCATIONS WHERE accountno= "+accno.toString() +" order by TRANSCATDATE desc");
		
          
            ResultSet rs1=ps1.executeQuery();
            System.out.println("After result set");
       
		
        
			
			out.print("<table align='left'  cellspacing='6' cellpadding='6'>");
			out.print("<tr><th>ACCOUNTNo</th><th>TRANSCATIONDATE</th><th>NARRATION</th><th>WITHDRAWL</th><th>DEPOSIT</th><th>BALANCE</th></tr>");
			
			while(rs1.next()){				
				out.print("<tr>");
				out.print("<td>" + rs1.getInt(6) + "</td>");				
				out.print("<td>" + rs1.getString(1) + "</td>");
				out.print("<td>" + rs1.getString(2) + "</td>");				
				out.print("<td>" + rs1.getInt(3) + "</td>");
				out.print("<td>" + rs1.getInt(4) + "</td>");
				out.print("<td>" + rs1.getInt(5) + "</td>");
								
				
				
				session.setAttribute("accountno",rs1.getInt(6));
			    
				out.print("</tr>");
			    
			}
			out.print("</table>");
			
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%>
			
		

<br><br>
		


</body></html>
