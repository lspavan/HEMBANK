package g;
import java.sql.*;

import g.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(String username,String fullname,String password,String repassword,double amount,String adderess,double phone,String email){
	//public static int register(String email,String password,String gender,String country,String name){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?,?,?)");
		int	nextvalue1=GetCon.getPrimaryKey();
		System.out.println("next value is "+nextvalue1);
		ps.setInt(1,nextvalue1);
		ps.setString(2,username);
		ps.setString(3, fullname);
		ps.setString(4,password);
		ps.setString(5,repassword);
		ps.setDouble(6,amount);
		ps.setString(7,adderess);
		ps.setDouble(8,phone);
		ps.setString(9,email);
		
		status=ps.executeUpdate();
		return status;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return -1;
	}
	
	
}
}
