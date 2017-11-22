package g;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g.Main;



public class CreateServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int accn=0;
		int status=-1;
		String username=request.getParameter("username");
		String fullname=request.getParameter("fullname");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		String amoun=request.getParameter("amount");
		double amount=Double.parseDouble(amoun);
		
		String adderess=request.getParameter("adderess");
		
		String ph=request.getParameter("phone");
		String email=request.getParameter("email");
		System.out.println("Email id is :::"+email);
		double phone=Double.parseDouble(ph);
		
		if(email.contains("@") && (email.contains(".com") || email.contains(".in") || email.contains(".se") )){
			System.out.println("email contaiing @");
	     status=RegisterUser.register(username,fullname, password, repassword, amount, adderess,phone,email);
		}
	    

try{
		    Connection con1=GetCon.getCon();		
			PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
		
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
				int  accountno=rs1.getInt(1);
				request.setAttribute("accountno",accountno);
				}
		    Integer accountno=(Integer)request.getAttribute("accountno");
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
			System.out.println("Interger converted one:::"+accountno);
        
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()){				
				
				 accn=rs.getInt(1);
			}
			
}catch(Exception e){
	e.printStackTrace();
}
	    
		
		
	out.close();	
	}

}
