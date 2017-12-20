package g;
import java.sql.*;

import g.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(String personalnumber,String fullname,String address,double phone,String email,String statu){
	

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?,?)");
		int	nextvalue1=GetCon.getPrimaryKey();
		System.out.println("next value is "+nextvalue1);
		ps.setInt(1,nextvalue1);
		ps.setString(2,personalnumber);
		ps.setString(3, fullname);
		
		//ps.setDouble(4,amount);
		ps.setString(4,address);
		ps.setDouble(5,phone);
		ps.setString(6,email);
		ps.setString(7,statu);
		ps.setDouble(8,0);
		
		status=ps.executeUpdate();
		return status;
	} catch (SQLException e) {
		
		e.printStackTrace();
		return -1;
	}
	
	
}
}
