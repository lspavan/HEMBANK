


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
window.history.forward();
window.history.go(-100);
//location.replace(logouturl);
window.location="http://localhost:8089/HEMBANK/login.jsp";
}



</script>

</head>

<body>

<script type="text/javascript">
//document.onload = ctck();
</script>
<%

request.getSession().invalidate();
 //response.sendRedirect(request.getContextPath()+"login.jsp");
 
// out.print("You Have been logged out....");%>
 
 <script>
alert("You have been logged out. Thanks for visiting HEM BANK");
 window.close();
 </script>
 

 

</body>
</html>
