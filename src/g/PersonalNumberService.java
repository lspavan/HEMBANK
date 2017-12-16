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
public class PersonalNumberService {
	
	public boolean validate(String perNo,String fullname){
		String personalNumber="";
		String fullName="";
		String encPerNo="";
		String encUsrName="";
		boolean preCheck=false;
		System.out.println("perno is "+perNo);
		SecurityG3 s1=new SecurityG3();
		perNo=s1.encrypt(perNo,"ssshhhhhhhhhhh!!!!");
		System.out.println("Validating the personal number sent from page with personal number service "+perNo);
		try{
		Connection con=GetCon.getCon();
		PreparedStatement ps=con.prepareStatement("Select * from PERSONALNUMBER where personalnumber=?");
		
        ps.setString(1,perNo);
		ResultSet rs=ps.executeQuery();
		
		
		if(rs.next()){
			preCheck=true;
	personalNumber=rs.getString(1);
	fullName=rs.getString(2);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		System.out.println("encrypted values received from the database "+personalNumber+" name "+fullName);
		if(preCheck){
			SecurityG3 s2=new SecurityG3();
			System.out.println("INSIDE PRECHECK");
			encUsrName=s2.decrypt(fullName,"ssshhhhhhhhhhh!!!!");
			System.out.println("Dedrypted user name "+encUsrName);
			encPerNo=s2.decrypt(personalNumber,"ssshhhhhhhhhhh!!!!");
			System.out.println("Decrypted personal number "+encPerNo);
			
		}
		System.out.println("comaprisions "+personalNumber+"--"+perNo+"--"+encUsrName+"--"+fullname);
		if(personalNumber.equals(perNo) && encUsrName.equals(fullname)){
			System.out.println("Bother are matched");
			return true;
		}else{
			System.out.println("Bother are not matched");
			return false;
		}
		
		
	}

}
