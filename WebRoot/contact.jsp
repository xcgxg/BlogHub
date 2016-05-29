<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "contact.jsp",PageContext.SESSION_SCOPE);
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>

<head>

  <base href="<%=basePath%>">

  <title>BlogHub</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" type="text/css" href="css/Tangerine.css" />
  <link rel="stylesheet" type="text/css" href="css/Yanone_Kaffeesatz.css" />
  <link rel="stylesheet" type="text/css" href="style/style.css" />
  
  	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	<link rel="stylesheet" href="css/bootstrap.css">
  
</head>

<body>
  <div id="main">
    <div id="header">
      <c:import url="logo.jsp"></c:import>
      <c:import url="menubar.jsp"></c:import> 
    </div>
    <div id="site_content">
    
      <c:import url="sidebar_container.jsp" charEncoding="UTF-8"></c:import>
      
      <div id="content">
        <!-- insert the page content here -->
        <h1><strong>联系BlogHub</strong></h1>
        <h2><small>写下您的联系方式和想说的话~</small></h2>
        <div class="row-fluid">
	        <form class="form-group" action="" method="post" >
	        	<div class="form-group input-md">
	        		<label for="name">姓名 </label> <br>
	        		<div class="form-group">
	        			<input id="name" class="form-control" type="text" name="name"/>
					</div>
				</div>
				<div class="form-group input-md">
					<label for="email">邮箱  </label> <br>
					<div class="form-group">
						<input id="email" class="form-control" type="email" name="email"/>
					</div>
				</div>
				<div class="form-group input-md">
					<label for="message">留言  </label> <br>
					<div class="form-group">
						<textarea id="message" class="form-control" rows="9" name="message">说点啥呢...</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="提交" /> <br>
				</div>
			</form>
		</div>
       </div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>

  </div>
</body>
</html>
