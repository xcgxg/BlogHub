<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
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
  <link rel="stylesheet" type="text/css" href="css/Yanone+Kaffeesatz.css" />
  <link rel="stylesheet" type="text/css" href="style/style.css" />

</head>

<body>
  <div id="main">
    <div id="header">
      <div id="logo">
        <h1><a href="${basePath}">Blog</a>Hub</h1>
        <div class="slogan">Cool Blog Goes Here!</div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->
          <li class="current"><a href="index.jsp">Home</a></li>
          <li><a href="example.jsp">Example</a></li>
          <li><a href="page.jsp">A Page</a></li>
          <li><a href="another_page.jsp">Another Page</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      <div id="sidebar_container">
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
        <!-- insert your sidebar items here -->
        <h3>Latest News</h3>
        <h4>What's the News?</h4>
        <h5>1st July 2011</h5>
        <p>Put your latest news item here, or anything else you would like in the sidebar!<br /><a href="#">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Newsletter</h3>
          <p>If you would like to receive our newletter, please enter your email address and click 'Subscribe'.</p>
          <form method="post" action="#" id="subscribe">
            <p style="padding: 0 0 9px 0;"><input class="search" type="text" name="email_address" value="your email address" onclick="javascript: document.forms['subscribe'].email_address.value=''" /></p>
            <p><input class="subscribe" name="subscribe" type="submit" value="Subscribe" /></p>
          </form>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Latest Blog</h3>
          <h4>Website Goes Live</h4>
          <h5>1st July 2011</h5>
          <p>We have just launched our new website. Take a look around, we'd love to know what you think.....<br /><a href="#">read more</a></p>
        </div>
      </div>
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
    <div id="footer">
      <p>Copyright &copy; simplestyle_7 | <a href="http://www.cssmoban.com/cssthemes/html5moban/">HTML5 模板</a> | <a href="#">CSS</a> | <a href="http://www.cssmoban.com/">模板之家</a></p>
    </div>
  </div>
</body>
</html>