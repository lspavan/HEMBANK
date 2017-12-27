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
public class SecurityG3Test {
	
	
	 @Mock
	    public Connection c;
	    @Mock
	    public PreparedStatement stmt;
	    @Mock
	    public ResultSet rs;
	
	
	
	@Test
    public void encryptTest() throws SQLException{
		
		
		Mockito.when(c.prepareStatement("Select * from NEWACCOUNT where personalnumber=?")).thenReturn(stmt);
		SecurityG3 anstest=new SecurityG3();
		String number=anstest.encrypt("198708188899","ssshhhhhhhhhhh!!!");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	
	
	

	
	}

