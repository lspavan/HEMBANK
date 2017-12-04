<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}

function dil(form)
{

  		var email=document.F1.eamil.value;
  		 alert(email);
  	    substring = "@";
  	if(email.includes(substring)){
  		 return true;
  	   }else{
  		   alert("not a valid email id");
  		   return false;
  	   }
  	
  	
  	
  	
	if(!isNaN(document.F1.phone.value))
	   {
		   if(document.F1.phone.value >9999999999 )
		   {
			 alert("ye kabhi nhi aayegi")
			 document.F1.phone.value=""
			 document.F1.phone.focus()
	         return false   
		   }
	   
	   else
	   {
	       alert("This  field  must  be  number")
		   document.F1.phone.value=""
		   return false
	   }
		}
  	
  	   }            

  	   
  	   
</SCRIPT>

</head>

<body>

	<div id="top_links">


		<div id="header">
		<h1>HEM BANK<span class="style1"></span></h1>
<h2>TRANSCAT SIMPLE</h2>
<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>			
		</div>

		<div id="navigation">
			<ul>
				
			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1>Services</h1>
						<br>
						<ul>
        	<li><a href="#">https://www.hembank.se/</a></li>           
            </ul>

					</div>
				</td>

				<td width="1200" valign="top">
					
								
							<form name=F1 onSubmit="return dil(this)" action="profileUpdate.jsp" >
								
								<table>
								<tr><td><b>Profile Details</b> </td></tr>
								<tr><td>Full Name:</td> <td></td></tr>
								<tr><td>User Id:</td> <td></td></tr>
								<tr><td>Address:</td> <td></td></tr>
								<tr><td>Phone:</td> <td></td></tr>
								<tr><td>New Phone</td><td><input type="text" name="phone"></td></tr>
								<tr><td>Email:</td> <td></td></tr>
								<tr><td>New Email</td><td><input type="text" name="email"/></td></tr>
								
								<tr><td></td><td><input type="submit" value=" save "></td></tr>
								</table>
								</form>
								<% out.print("<tr>");
								
								
								out.print("</tr>");
							
							}
							out.print("</table>");
							
						
							
						%>
					
						</font></td></tr>
					</table> 
				
		</table>
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

		