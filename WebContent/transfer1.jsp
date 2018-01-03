


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">



	function dil(form) {
		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value == "") {
				alert("Fill out all Fields")
				document.F1.accountno.focus()
				return false
			}
		}

		if (isNaN(document.F1.accountno.value)) {
			alert("A/C No.  must  be  number & can't be null")
			document.F1.accountno.value = ""
			document.F1.accountno.focus()
			return false
		}

		if (!isNaN(document.F1.username.value)) {
			alert("User Name  must  be  char's & can't be null")
			document.F1.username.value = ""
			document.F1.username.focus()
			return false
		}

		if (!isNaN(document.F1.password.value)) {
			alert("Password  must  be  char's & can't be null")
			document.F1.password.value = ""
			document.F1.password.focus()
			return false
		}

		if (isNaN(document.F1.taccountno.value)) {
			alert("target account  must  be  number & can't be null")
			document.F1.taccountno.value = ""
			document.F1.taccountno.focus()
			return false
		}
		if (document.F1.accountno.value == document.F1.taccountno.value) {
			alert("You can not transfer money online to your own account..");
			document.F1.taccountno.value = ""
			document.F1.taccountno.focus()
			return false
		}

		if (isNaN(document.F1.amount.value)) {
			alert("Amount  must  be  number & can't be null")
			document.F1.amount.value = ""
			document.F1.amount.focus()
			return false
		}

		return true
	}
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");

	}
</script>

</head>

<body onload="if (location.href.indexOf('reload')==-1) location.replace(location.href+'?reload')">

	<div id="top_links">


		<div id="header">
			<h1>
				HEM BANK<span class="style1"></span>
			</h1>
			<h2>TRANSCAT SIMPLE</h2>
			<A href="index.html"><IMG SRC="images/home1.gif"></IMG></A> <br>
			<br> <br>
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
    <button class="dropbtn">GET FUNDS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     <a href="/HEMBANK/balance.jsp">BALANCE</a>
      <a href="statement.jsp">STATEMENT</a>
				<a href="emailstatement.jsp">ESTATMENT</a>
      
    </div>
  </div> </li>
  
  
  
 <li><div class="dropdown">
    <button class="dropbtn">MANAGE FUNDS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
	<a href="/HEMBANK/paybill1.jsp">BILL PAY</a>
	<a href="/HEMBANK/financialdev.jsp">FINCIALDEV</a>
      
    </div>
  </div> </li>
  
  
   <li><div class="dropdown">
    <button class="dropbtn">USER RELATED
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
<a href="/HEMBANK/userrating.jsp">USER RATING</a>
<a href="/HEMBANK/profile.jsp">PROFILE</a>
      
    </div>
  </div> </li>
  <li><div class="dropdown">
    <button class="dropbtn">ABOUT US
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
<a href="/HEMBANK/about.jsp">ABOUT US</a>      
    </div>
  </div> </li>				
						
			</ul>
		</div>



		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="550px" valign="top"
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

				<td width="650px" valign="top">
					<div id="welcome" style="border-right: #666666 1px ;">
						<h1>TRANSFER FORM</h1>
						<br>
						<table align="center" bgcolor="white">
							<tr>

							</tr>
							<tr>
								<td><div>
										<%
											if (request.getAttribute("balance") != null) {%>
												<span style="color:blue"><% out.print(request.getAttribute("balance"));
											}
										
										String perNo=session.getAttribute("perNo").toString();
										session.setAttribute("perNo", perNo);
										
										%></span>
									</div>
									<form name=F1 onSubmit="return dil(this)" action="transfer.jsp">
									
										<table cellspacing="5" cellpadding="3">
										
											<tr>
												<td><font color="black">SECURITY ID:</font></td>
												<td><font color="black"><input type="text" name="bankId" /></font></td>
											</tr>
											
											<tr>
												<td><font color="black">TARGET ACCOUNT NO:</font></td>
												<td><font color="black"><input type="text" name="taccountno" /></font></td>
											</tr>
											<tr>
												<td><font color="black">AMOUNT:</font></td>
												<td><font color="black"><input type="text" name="amount" /></font></td>
											</tr>
											
											<tr>
												<td></td>
												<td><input type="submit" value="SUBMIT" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													
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

			<div id="footer_copyright">

				<p>HEM Bank is the global source of information about and access
					to financial services provided by the HEM group family of
					companies.</p>

				Copyright © HEM Bank 2015
			</div>

			<script type="text/javascript">
document.onload = ctck();
</script>
		</div>
		</div>
</body>
</html>
