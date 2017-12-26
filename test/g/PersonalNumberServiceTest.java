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
public class PersonalNumberServiceTest {
	
	
	 @Mock
	    public Connection c;
	    @Mock
	    public PreparedStatement stmt;
	    @Mock
	    public ResultSet rs;
	
	
	
	@Test
    public void myTestMethod() throws SQLException{
		
		
		Mockito.when(c.prepareStatement("Select * from NEWACCOUNT where personalnumber=?")).thenReturn(stmt);
		PersonalNumberService anstest=new PersonalNumberService();
		boolean number=anstest.validate("198708188899","PAVAN KUMAR LAKSHMISETTY");
		System.out.println("out put value is "+number);
		
		Assert.assertNotNull(number);
		
	}
	}

