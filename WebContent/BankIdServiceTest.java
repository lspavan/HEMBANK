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
public class BankIdServiceTest {
	
	
	 @Mock
	    public Connection c;
	    @Mock
	    public PreparedStatement stmt;
	    @Mock
	    public ResultSet rs;
	
	
	
	@Test
    public void myTestMethod() throws SQLException{
		
		
		Mockito.when(c.prepareStatement("Select * from NEWACCOUNT where personalnumber=?")).thenReturn(stmt);
		BankIdService anstest=new BankIdService();
		boolean number=anstest.validate("KiXDODB7eyCbbaYfwKyWrA==", "1987");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	}

