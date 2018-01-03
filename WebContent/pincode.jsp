


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
		<link rel="stylesheet" href="jquery.numpad.css">
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
		<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
		<script src="jquery.numpad.js"></script>
		<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script type="text/javascript">
			// Set NumPad defaults for jQuery mobile. 
			// These defaults will be applied to all NumPads within this document!
			$.fn.numpad.defaults.gridTpl = '<table class="ui-bar-a"></table>';
			$.fn.numpad.defaults.backgroundTpl = '<div class="ui-popup-screen ui-overlay-a"></div>';
			$.fn.numpad.defaults.displayTpl = '<input data-theme="b" type="text" />';
			$.fn.numpad.defaults.buttonNumberTpl =  '<a data-role="button" data-theme="b"></a>';
			$.fn.numpad.defaults.buttonFunctionTpl = '<a data-role="button" data-theme="a"></a>';
			$.fn.numpad.defaults.onKeypadCreate = function(){$(this).enhanceWithin();};
			
			// Instantiate NumPad once the page is ready to be shown
			$(document).on('pageshow', function(){
				$('#text-basic').numpad();
				$('#password').numpad({
					displayTpl: '<input data-theme="b" type="password" />',
					hidePlusMinusButton: true,
					hideDecimalButton: true
				});
				$('#numpadButton-btn').numpad({
					target: $('#numpadButton'),
				});
				$('#numpad4div').numpad();
				$('#numpad4column .qtyInput').numpad();
			});
		</script>
		<style type="text/css">
			.controlgroup-textinput{
				padding-top: .22em;
				padding-bottom: .22em;
			}
		</style>
		




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

function noSubmit(){

	return false;
}
</script>

</head>

<body>


<%
String perNo=request.getParameter("perNo");
request.setAttribute("perNo", perNo);
String status="";
boolean preCheck=false;
String personalNumber="";
String persNo="";

System.out.println("received is "+perNo);
SecurityG3 s1=new SecurityG3();
 persNo=s1.encrypt(perNo,"ssshhhhhhhhhhh!!!!");
System.out.println("persNo"+persNo);
try {



	Connection con1=GetCon.getCon();
	String query="Select * from NEWACCOUNT where personalnumber='"+persNo+"'";
	PreparedStatement ps1=con1.prepareStatement(query);
	System.out.println("query is "+query);
   
    System.out.println("before result set");
	ResultSet rs=ps1.executeQuery();
	System.out.println(query);
	
	if(rs.next()){
		preCheck=true;
personalNumber=rs.getString(2);
status=rs.getString(7);
System.out.println(" From database "+personalNumber+"--"+status);
	}
	
if(preCheck){
	if(persNo.equals(personalNumber) && status.equals("create")){
	
	%>
		
	




<div id="top_links">
  

<div id="header">
	<h1>HEM BANK<span class="style1"></span></h1>
			<h2>TRANSCAT SIMPLE</h2>
</div> <br>


<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	
    
    <td width="1200" valign="top">
    	<div id="welcome" style="border-right:#666666 1px ;"><h1>ENTER DETAILS HERE</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
		
		</tr>
		<tr>
			<td><div><%if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			}
			
			 %></div>
				<form id="1" action="activateupdate.jsp">
				   <table cellspacing="5" cellpadding="3">	
				  <tr><td> 
				  
			
			<div data-role="controlgroup" data-type="horizontal">
				<input type="password" id="numpadButton" data-wrapper-class="controlgroup-textinput ui-btn" value="0" maxlength="4" name="pincode" >
				<button id="numpadButton-btn" class="ui-btn ui-icon-grid ui-btn-icon-notext ui-alt-icon ui-nodisc-icon" onclick="noSubmit();return false;">&nbsp;</button>
			</div>
        			<input type="hidden" name="hiddenperNo" value="<%=perNo%>"/>
				  </td> <td align="center"><input type="submit" value="Go"/></td> </tr>
							
								
                   
                   
             	</table>
				</form>	
			</td>
		</tr>
	</table>
    	   </div>      
    </td>
    
    <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>At HEM Bank we want to help our customers do well. That’s why we try to make it easy for you to succeed.</p>
		    <br>
		     <!-- <p> Our banking products are simple and less complicated, and designed to keep your hard-earned money in your pocket. --> 
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


<!-- Saving the active with newaccount -->
							<%Connection cona=GetCon.getCon();
							PreparedStatement psa=cona.prepareStatement("update  NEWACCOUNT set status='active' where personalnumber='"+personalNumber+"'");						            
							ResultSet rsa=psa.executeQuery();							
							%>
<!-- End of newaccount update -->




<%}else if(status.equals("active")){
		out.print("Your Account activated already.. please login using PIN code or contact branch to reset your PIN code");
		    		request.setAttribute("balance","Your Account activated already..");%>
		    		<jsp:forward page="activate.jsp"></jsp:forward> 
	<%}else{
		out.print("You Dont have account created in our branch..");
	}
}
}catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>
<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="g.*"%>