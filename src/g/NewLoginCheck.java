package g;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NewLoginCheck {
	public boolean login(String personalNumber,String pinCode){
		boolean check=false;
	try{
		Connection con1=GetCon.getCon();
		String query="Select * from ACTIVATION where personalnumber='"+personalNumber+"' and pincode='"+pinCode+"'";
		PreparedStatement ps1=con1.prepareStatement(query);
		System.out.println("query is "+query);
	   
	    System.out.println("before result set");
		ResultSet rs=ps1.executeQuery();
		System.out.println(query);
		
		if(rs.next()){
			check=true;
	personalNumber=rs.getString(2);
	}
		
   
	}catch(Exception e){
		
	}
		
	return check;
	}

}
