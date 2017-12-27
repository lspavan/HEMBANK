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
public class BankIdService {
	
	public boolean validate(String perNo,String bankId){
		String locBankId="";
		boolean preCheck=false;
		System.out.println("perno is "+perNo);
		SecurityG3 s1=new SecurityG3();
		//String eperNo=s1.encrypt(perNo,"ssshhhhhhhhhhh!!!!");
		//bankId=s1.decrypt(bankId,"ssshhhhhhhhhhh!!!!");
		System.out.println("Bank IdValidating the personal number sent from page with personal number service "+perNo);
		try{
		Connection con=GetCon.getCon();
		PreparedStatement ps=con.prepareStatement("Select * from BANKID where personalnumber=?");
		
        ps.setString(1,perNo);
        
		ResultSet rs=ps.executeQuery();
		
		
		if(rs.next()){
			preCheck=true;
			locBankId=rs.getString(2);
			System.out.println("Ban id from DB is"+locBankId);
	
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		System.out.println("status of Bank id is "+preCheck);
	return  preCheck;
		
		
	}

}
