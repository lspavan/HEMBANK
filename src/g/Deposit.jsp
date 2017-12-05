<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  

<%
String email="";
     String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);

		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
	   // boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		
			
			
			
			if(rs1.next()){
			out.print("Balance has increase");
			request.setAttribute("totaldataamount",dataamount);
			request.setAttribute("balance","Balance has increased to  ");	
			%>

			<% 
			}
			

		 
		
			%>
    	


<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date,java.text.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>