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
		String personalnumber=request.getParameter("personalnumber");
		String fullname=request.getParameter("fullname");
	
		String adderess=request.getParameter("adderess");
		
		String ph=request.getParameter("phone");
		String email=request.getParameter("email");
		
		System.out.println("Email id is :::"+email);
		System.out.println("Personal number and full name from Page "+personalnumber+"--"+fullname);
		double phone=Double.parseDouble(ph);
		//double mname=Double.parseDouble(num);
		//String country=request.getParameter("country");
		
		
		//Validating the with the personal number database
				PersonalNumberService pns=new PersonalNumberService();
				boolean check=pns.validate(personalnumber.trim(),fullname.trim());
		
		//Encrypt Personal Number
				SecurityG3 s1=new SecurityG3();
		String perNo=s1.encrypt(personalnumber,"ssshhhhhhhhhhh!!!!");
		
		System.out.println("encrypted personal nubmer is:: "+ perNo);
		
		if(email.contains("@") && (email.contains(".com") || email.contains(".in") || email.contains(".se") && check ) && check){
			System.out.println("email contaiing @");
	     status=RegisterUser.register(perNo,fullname,adderess,phone,email,"create");
		}
	    

try{
		    Connection con1=GetCon.getCon();		
			PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
			//PreparedStatement ps1=con1.prepareStatement("Select accountno from NEWACCOUNT where accountno='"+passedaccountno+"'");
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
				int  accountno=rs1.getInt(1);
				request.setAttribute("accountno",accountno);
				}
		    Integer accountno=(Integer)request.getAttribute("accountno");
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
			System.out.println("Interger converted one:::"+accountno);
           // ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			
			/*out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");*/
			while(rs.next()){				
				
				 accn=rs.getInt(1);
				//String email=rs.getString(8);				    
			}
			
}catch(Exception e){
	e.printStackTrace();
}
	    
		if(status>0){
			//out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
			Main m=new Main();
			Integer accno = Integer.valueOf(accn);
	    	m.sendFromGMail("Welcome to HEM Bank","Your account number is  "+accno+"\n"+"Please use the below link to activate your account"+"\n"+"http://localhost:8086/HEMBANK/"+"\n"+ "\n"+"Thanks,"+"\n"+"HEM Bank",email);
	    	
			
			RequestDispatcher rd=request.getRequestDispatcher("successregistration.jsp");
			rd.include(request, response);
		}
		else{
			//out.print("Sorry,Registration failed. please try later");
			RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
