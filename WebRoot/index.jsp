<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "index.jsp",pageContext.SESSION_SCOPE);
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
      
	  <div class="inner_copyright">Collect from <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></div>
      <div id="content">
      	    <h2>Welcome to the BlogHub!</h2>
      	    
         <br>
        <p>
        	Hello! 各位博主们! <strong>BlogHub </strong>是一个卓越的个人博客网站. 在这里, 你可以展示你自己, 和别人分享你的生活 或者是随便写点什么!
        </p>
        <p>还在等什么?! Go <strong><a href="">Sign in</a></a></strong> or <strong><a href="">Sign up</a> </strong>now!</p>
        <p>Of course! 你也可以在这里搜索博主和文章!</p>
        <h2>Search</h2>
        
        <form class="form-group" action="" method="get" >
        	<label for="userOrArticle">搜索类型</label><br>
        	<div class="input-sm col-sm-3"  style="padding-left:0px;">
				<select class="form-control" name="userOrArticle" id="userOrArticle">
					<option value="title">文章标题</option>
					<option value="digest">文章摘要</option>
					<option value="user">用户</option>
				</select>
			</div>
			<div class="input-sm col-sm-7">
				<input class="form-control" type="text" name="search_content"/>
			</div>
			<div class="input-sm col-sm-2" >
				<input type="submit" class="btn btn-default" style="width:100px;" value="搜索">
			</div>
		</form>
      </div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>