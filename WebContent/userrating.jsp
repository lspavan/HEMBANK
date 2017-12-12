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
	function navigate(){ 
		window.history.forward();
		window.history.go(-2);
	    window.location.replace('http://localhost:8089/HEMBANK/');
	   return false;
	}
	
	function dil(rate){		
		if(document.usrrateform.rating.value=='select'){
			alert("Please select one rating option before you proceed");
			return false;
		}else{
			var value=document.usrrateform.rating.value;
			return true;
		}
	}
	
</script>
<style>
.button {
	background-color: #DFDCE3;
	border: #999999;
	color: #0375B4;
	padding: 2px 3px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 11px;
	margin: 3px 2px;
	cursor: pointer;
}
</style>
</head>

<body>

	<div id="top_links">


		<div id="header">
			<h1>
				HEM BANK<span class="style1"></span>
			</h1>
			<h2>TRANSCAT SIMPLE</h2>
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A> <br>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logout.jsp" >logout</a>
		</div>

		<div id="navigation">
			<ul>

				<li><a href="balance.jsp">VIEW BALANCE</a></li>
				<li><a href="statement.jsp">STATEMENT</a></li>
				<li><a href="emailstatement.jsp">ESTATMENT</a></li>	
				<li><a href="transfer1.jsp">TRANSFER</a></li>
				<li><a href="paybill1.jsp">BILL PAY</a></li>
				<li><a href="financialdev.jsp">FINCIALDEV</a></li>				
				<li><a href="profile.jsp">PROFILE</a></li>
				
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
							<li><a href="http://localhost:8089/HEMBANK/about.jsp">https://www.hembank.se/</a></li>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top">
					
					<table>
						<tr>
							<td><font color="black"> 
							    <table border=1 align=center>
							    <tr><td><span style="color:blue;"> Current Rating is: </span>&nbsp;&nbsp;<b>
							    
							   </b>
							    
							    </td></tr>
							    
							    </table>
								
								
								
							<form name="usrrateform" id="usrform" onSubmit="return dil(this)" action="ratingupdate.jsp">
							<table border="1" align="center"><tr><td>
							<span style="color:black;"> Please provide your rating below: </span><br><br>
										<select name="rating">
											<option value="select">Select</option>
											<option value="five">5-Excellent</option>
											<option value="four">4-Good</option>
											<option value="three">3-Average</option>
											<option value="two">2-Need Improvement</option>
											<option value="one">1-Poor</option>
										</select></td></tr>
							<br>
							<tr><td>
							<textarea rows="4" cols="50" name="comment" >Enter comments here...</textarea>

							</td></tr>
							<tr><td>
							<input type="submit" name="Submit" value=" Submit Rating "></td></tr></table>

									</form>
							
							</font></td>
						</tr>
					</table> 
				
		</table>



		




		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright">
				<p>HEM Bank is the global source of information about and access
					to financial services provided by the HEM group family of
					companies.</p>

				Copyright © HEM Bank 2015
			</div>
		</div>

		<script type="text/javascript">
document.onload = ctck();
</script>
	</div>
</body>
</html>