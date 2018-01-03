


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{

var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>HEM BANK<span class="style1"></span></h1>
			<h2>TRANSCAT SIMPLE</h2>	

</div>

<br>
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	
    
    <td width="500" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>ENTER PINCODE HERE</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
		
		</tr>
		<tr>
			<td><div><font color="red"><%if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			}
			
			 %></font></div>
				<form name=F1  action="pincode.jsp" >
				   <table cellspacing="5" cellpadding="3">	
				  <tr><td><font color="black">PERSONAL NUMBER</font></td><td> <input type="text" name="perNo"/></td></tr>
							
					<tr><td></td><td><input type="submit" value=" Go "/>
					
                   </td></tr>
             	</table>
				</form>
			</td>
		</tr>
	</table>
    	   </div>      
    </td>
    
    <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px ;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>At HEM Bank we want to help our customers do well. That’s why we try to make it easy for you to succeed.</p>
		    <br>
		      
		      <p>And we make it easy for you to keep on top of your online banking options.  With the right products and our knowledgeable staff to guide you – we are confident there is no goal too high for you to achieve.</p>
	    	
	    </div>     
    </td>
            	
    
</tr></table>
    
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
<div id="footer_copyright" >
		    <p>HEM Bank is the global source of information about and access to financial services provided by the HEM group family of companies.</p>	  
  Copyright © HEM Bank 2015</div>
		</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>
