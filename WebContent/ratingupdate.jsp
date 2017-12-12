<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEM Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<%
 String rating=request.getParameter("rating");							 
							 Object accno=session.getAttribute("accountno");
							 String Accn=accno.toString();
							
								 String comments=request.getParameter("comment");
								 String query="";								 
								 if(!rating.equals(null) || !rating.equals("")){
									if(rating.equals("five")){
									query="update rating set five=five+1";
									}else if(rating.equals("four")){
										query="update rating set four=four+1";
										}else if(rating.equals("three")){
											query="update rating set three=three+1";
										}else if(rating.equals("two")){
											query="update rating set two=two+1";
										}else{
											query="update rating set one=one+1";
										}
									
									
									Connection conr=GetCon.getCon();
									PreparedStatement psr=conr.prepareStatement(query);
									ResultSet rsr=psr.executeQuery();
									
								 }
								
													
							
								int accountno=Integer.parseInt(Accn);						        
								
							   
								
							Connection con=GetCon.getCon();
							PreparedStatement ps=con.prepareStatement("insert into ratedcustomer (customerid,comments) values(?,?)");
						            ps.setInt(1,accountno);
						            ps.setString(2,comments);
							ResultSet rs=ps.executeQuery();
							
							session.setAttribute("accountno",accountno);
							
							%>
							
							
							<%}catch (SQLException e) {
							e.printStackTrace();
							System.out.println("session expired please login again");
								}
								
								//}
								
							//}
						%>
</body>
</html>
