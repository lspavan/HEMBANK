


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
</script>

</head>

<body>

	<div id="top_links">


		<div id="header">
		<h1>HEM BANK<span class="style1"></span>
			</h1>
			<h2>TRANSCAT SIMPLE</h2>
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
					  <li><div class="dropdown">
    <button class="dropbtn">USER RELATED 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     <a href="activate.jsp">RE-ACTIVATE</a>
     <a href="/HEMBANK/create.html">CREATE</a>
    </div>
  </div> </li>
 				  
			
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
							<li>
<a href="/HEMBANK/quicklinks.html" 
  target="popup" 
  onclick="window.open('/HEMBANK/quicklinks.html','popup','width=600,height=600'); return false ;">
   Quick Links
</a></li>
						</ul>

					</div>
				</td>

				<td width="1200" valign="top">
					<div id="welcome" style="border-right: #666666 1px ;">
						<h1>DEPOSIT FORM</h1>
						<br>
						<table align="center" bgcolor="white">
							<tr>

							</tr>
							<tr>
								<td><div>
										<%
											if (request.getAttribute("balance") != null) {
												out.print(request.getAttribute("balance"));
											}
										%>
									</div>
									<form name=F1 onSubmit="return dil(this)" action="deposit.jsp">
										<table cellspacing="5" cellpadding="3">
											<tr>
												<td><font color="black">ACCOUNT NO:</font></td>
												<td><font color="black"><input type="text" name="accountno" /></font></td>
											</tr>
											
											<tr>
												<td><font color="black">AMOUNT:</font></td>
												<td><font color="black"><input type="text" name="amount" /></font></td>
											</tr>
									

											<tr>
												<td></td>
												<td><input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</td>
											</tr>
										</table>
									</form></td>
							</tr>
						</table>
					</div>
				</td>

			


			</tr>
		</table>
		<div id="footer_top">
			<div id="footer_navigation"></div>

			<div id="footer_copyright" >
		    <p>HEM Bank is the global source of information about and access to financial services provided by the HEM group family of companies.</p>
	  
  Copyright © HEM Bank 2015</div>
</div>
		</div>

		<script type="text/javascript">
document.onload = ctck();
</script>
	

</body>
</html>
