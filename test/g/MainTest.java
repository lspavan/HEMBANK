package g;

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
public class MainTest {
	

	
	
	
	@Test
    public void myTestMethod() throws SQLException{
		Main anstest=new Main();
		anstest.sendFromGMail("Test Subject","Body mail...","lakshmisetty.pavan@gmail.com");
		
		
	}
	}

