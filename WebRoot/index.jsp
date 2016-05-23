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
        <!-- insert the page content here -->
        <h1>Welcome to the simplestyle_7 template</h1> <br>
        <p>This standards compliant, simple, fixed width website template is released as an 'open source' design (under a Creative Commons Attribution 3.0 Licence), which means that you are free to download and use it for anything you want (including modifying and amending it). All I ask is that you leave the 'Collect from cssmoban.com' link in the footer of the template, but other than that...</p>
        <p>This template is written entirely in <strong>HTML5</strong> and <strong>CSS</strong>, and can be validated using the links in the footer.</p>
        <p>You can view more free HTML5 web templates <a href="http://www.cssmoban.com/">模板</a>.</p>
        <p>This template is a fully functional 5 page website, with an <a href="examples.html">examples</a> page that gives examples of all the styles available with this design.</p>
        <h2>Browser Compatibility</h2>
        <p>This template has been tested in the following browsers:</p>
        <ul>
          <li>Internet Explorer 8</li>
          <li>Internet Explorer 7</li>
          <li>FireFox 3.5</li>
          <li>Google Chrome 6</li>
          <li>Safari 4</li>
        </ul>
      </div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>