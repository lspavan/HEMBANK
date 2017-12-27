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
public class AccountNumberService {
	
	public int validate(String perNo){
		int accNo=0;
		boolean preCheck=false;
		System.out.println("perno is "+perNo);
		SecurityG3 s1=new SecurityG3();
		//perNo=s1.decrypt(perNo,"ssshhhhhhhhhhh!!!!");
		
		System.out.println("Validating the personal number sent from page with personal number service "+perNo);
		try{
		Connection con=GetCon.getCon();
		PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where personalnumber=?");
		
        ps.setString(1,perNo);
        
		ResultSet rs=ps.executeQuery();
		
		
		if(rs.next()){
			preCheck=true;
			accNo=rs.getInt(1);
	
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	return  accNo;
		
		
	}

}
