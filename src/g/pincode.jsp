<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



</head>
<body>
<%
String perNo=request.getParameter("perNo");
String status="";
boolean preCheck=false;
String personalNumber="";
String persNo="";

System.out.println("received is "+perNo);
SecurityG3 s1=new SecurityG3();
 persNo=s1.encrypt(perNo,"ssshhhhhhhhhhh!!!!");
System.out.println("persNo"+persNo);
try {
	
	
}catch(Exception e){
	e.printStackTrace();
}
%>	



</body>
</html>
<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>