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
public class NewLoginCheckTest {
	
	
	 @Mock
	    public Connection c;
	    @Mock
	    public PreparedStatement stmt;
	    @Mock
	    public ResultSet rs;
	
	
	
	@Test
    public void loginCheckMethod() throws SQLException{
		
		
		Mockito.when(c.prepareStatement("Select * from ACTIVATION where personalnumber='"+"KiXDODB7eyCbbaYfwKyWrA=="+"' and pincode='"+"TCqE9A3bitfSkQogy1hHYA=="+"'")).thenReturn(stmt);
		NewLoginCheck anstest=new NewLoginCheck();
		boolean number=anstest.login("KiXDODB7eyCbbaYfwKyWrA==", "TCqE9A3bitfSkQogy1hHYA==");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	}

