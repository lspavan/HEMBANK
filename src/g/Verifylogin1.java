package g;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class verifyLogin1 {

public static boolean checkLogin(int accountno,String username,String password){
	boolean status=false;
	int accountno1=0;
	Connection con=GetCon.getCon();
	try {
		//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
		PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=? and username = ? and password =?");
		ps.setInt(1,accountno);
		ps.setString(2,username);
		ps.setString(3,password);
		System.out.println("accno usrname and password "+ accountno+" "+username+" "+password);
		ResultSet rs=ps.executeQuery();
		/*while(rs.next()){
		accountno1=rs.getInt(1);
		System.out.println("inside result set:::"+accountno1);
		if(accountno==accountno1);{
			status=true;
		}
		}*/
		status=rs.next();
		
		System.out.println("Status of login verify is :::"+status+"and from db "+ accountno1);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;
