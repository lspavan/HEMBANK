package g;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import junit.framework.Assert;
import g.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import static org.junit.Assert.*;
@RunWith(MockitoJUnitRunner.class)
public class LOGINTRANSCATIONSTest {
	
	
	 @Mock
	    public Connection c;
	    @Mock
	    public PreparedStatement stmt;
	    @Mock
	    public ResultSet rs;
	
	
	
	@Test
    public void myTestMethod() throws SQLException{
		
		
		Mockito.when(c.prepareStatement("Select * from NEWACCOUNT where personalnumber=?")).thenReturn(stmt);
		LOGINTRANSCATIONS anstest=new LOGINTRANSCATIONS();
		boolean number=anstest.loginTranscat("KiXDODB7eyCbbaYfwKyWrA==");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	
	
	@Test
    public void getTranscatMethod() throws SQLException{
		Mockito.when(c.prepareStatement("SELECT MAX(LOGINDATE) FROM LOGINTRANSCATIONS WHERE PERSONALNUMBER=?")).thenReturn(stmt);
		LOGINTRANSCATIONS ans=new LOGINTRANSCATIONS();
		String number=ans.getTranscat("KiXDODB7eyCbbaYfwKyWrA==");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	
	
	}

