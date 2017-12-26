package g;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LOGINTRANSCATIONS {
   public boolean loginTranscat(String personalNumber){
		boolean check=false;
		
		try{
		Connection con1=GetCon.getCon();
		java.util.Date today = new java.util.Date();
	    SimpleDateFormat sm = new SimpleDateFormat("MM/dd/yyyy hh:mm");			  
	    String strDate = sm.format(today);	
	    
		String query="INSERT INTO LOGINTRANSCATIONS (LOGINDATE,PERSONALNUMBER) VALUES (?,?)";
		
		PreparedStatement ps1=con1.prepareStatement(query);		
		ps1.setString(1, strDate);
		ps1.setString(2, personalNumber);
		System.out.println("query is "+query);
	   
	    System.out.println("before result set");
		ResultSet rs=ps1.executeQuery();
		
		
		if(rs.next()){
			check=true;
	
	}
		

	}catch(Exception e){
		
	}
		
	return check;
	}
	

}