


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
function dil(form)
{
   

   if(isNaN(document.F1.accountno.value))
   {
       alert("Accountno must  be  number & can't be null")
	   document.F1.accountno.value=""
	   document.F1.accountno.focus()
	   return false
   }
   if(!isNaN(document.F1.username.value))
   {
       alert("User Name  must  be  char's & can't be null")
	   document.F1.username.value=""
	   document.F1.username.focus()
	   return false
   }

 
   
   return true   
}
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


<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >    <br>
    <td width="600" valign="top">
    
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>PIN CODE</h1><br>
    	    <table  align="center" bgcolor="white">
		
		<tr><td><div><%if(request.getAttribute("accountdetails")!=null)
			{
			out.print(request.getAttribute("accountdetails"));
			}
			
			 %></div>
				<form name=F1 onSubmit="return dil(this)" action="index.jsp" >
				   <table >	
				  <tr><td> <br>
				  <tr><td>
				   <div>			
			<div data-role="controlgroup" data-type="horizontal">
				<input type="text" id="numpadButton" data-wrapper-class="controlgroup-textinput ui-btn" value="2" maxlength="4" onchange="alert('Value changed to ' + $(this).val());">
				<button id="numpadButton-btn" class="ui-btn ui-icon-grid ui-btn-icon-notext ui-alt-icon ui-nodisc-icon">&nbsp;</button>
			</div>
        </div></td></tr>
							
							
					<tr><td><input type="submit" value=" Go "/>
					&nbsp;                   
                   <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
             	</table>
				</form>
			</td>
		</tr>
	</table>
    	   </div>      
    </td>
    
    
    <td width="300" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
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

</body>
</html>
