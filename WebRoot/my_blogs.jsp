<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "my_blogs.jsp",pageContext.SESSION_SCOPE);
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
  <script>
  	function editclicked()
  	{
  		document.getElementById("myblog1").style.display="tablecell";
	    document.getElementById("myblog2").style.display="tablecell";
	    document.getElementById("myblog3").style.display="tablecell";
	    document.getElementById("myblog4").style.display="tablecell";
	    document.getElementById("myblog5").style.display="tablecell";
  	}
  </script>
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
        <div>
        	<form class="form-group" action="" method="get" >
        	<label for="userOrArticle">搜索类型</label><br>
        	<div class="input-sm col-sm-3" style="padding-left:0px;">
				<select class="form-control" name="userOrArticle" id="userOrArticle">
					<option value="title">文章标题</option>
					<option value="digest">文章摘要</option>
					<option value="user">用户</option>
				</select>
			</div>
			<div class="input-sm col-sm-7">
				<input class="form-control" type="text" name="search_content"/>
			</div>
			<div class="input-sm">
				<input type="submit" class="btn btn-default"  value="搜索">
			</div>
			</form>
		
        </div>
        <div>
        	<fieldset>
			<table style="margin:0px;">
			  <tr>
			    <td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 0px;">
			      <h3><font color="#FFC125">个</font><font color="#8DEEEE">人</font><font color="#EE2C2C">博</font><font color="#ADFF2F">客</font></h3>
			    </td>
			    
			  </tr>
			</table>
			<table id="myblogs" style="width:600px;">
         					<tr>
         					  <td>2016-05-28</td>
         					  <td ><a>从亚利桑那到犹他</a></td>
         					  
         					</tr>
          					<tr>
          					  <td>2016-05-25</td>
          					  <td ><a>无所谓女权的村上春树</a></td>
          					  
          					</tr>
          					<tr>
          					  <td>2016-05-20</td>
          					  <td ><a>简.勃朗特的悲伤爱情</a></td>
          					  
          					</tr>
          					<tr>
          					  <td>2016-05-12</td>
          					  <td ><a>从幂离到雪胸——武后一生的流行史</a></td>
          					  
          					</tr>
          					<tr>
          					  <td>2016-04-28</td>
          					  <td ><a>忘记校对时间的人</a></td>
          					 
          					</tr>
                		</table>
			
			
        
		</fieldset>
        </div>
		<div>
        	<fieldset>
			<table style="margin:0px;">
			  <tr>
			    <td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 0px;">
			      <h3><font color="#FFC125">搜</font><font color="#8DEEEE">索</font><font color="#EE2C2C">结</font><font color="#ADFF2F">果</font></h3>
			    </td>
			  </tr>
			</table>
			<table id="othersblogs" style="width:600px;">
         					<tr>
         					  <td>2016-05-28</td>
         					  <td><a>张三</a></td>
         					  <td ><a>从亚利桑那到犹他</a></td>
         					</tr>
          					<tr>
          					  <td>2016-05-25</td>
          					  <td><a>李四</a></td>
          					  <td><a>无所谓女权的村上春树</a></td>
          					</tr>
          					<tr>
          					  <td>2016-05-20</td>
          					  <td><a>王五</a></td>
          					  <td><a>简.勃朗特的悲伤爱情</a></td>
          					</tr>
          					<tr>
          					  <td>2016-05-12</td>
          					  <td><a>赵六</a></td>
          					  <td ><a>从幂离到雪胸——武后一生的流行史</a></td>
          					</tr>
          					<tr>
          					  <td>2016-04-28</td>
          					  <td><a>陈七</a></td>
          					  <td ><a>忘记校对时间的人</a></td>
          					</tr>
                		</table>
		</fieldset>
        </div>
        <h1>Examples</h1>
        <p>This page contains examples of all the styled elements available as part of this design. Use this page for reference, whilst you build your website.</p>
        <h2>Headings</h2>
        <p>These are the different heading formats:</p>
        <h1>Heading 1</h1>
        <h2>Heading 2</h2>
        <h3>Heading 3</h3>
        <h4>Heading 4</h4>
        <h5>Heading 5</h5>
        <h6>Heading 6</h6>
        <h2>Text</h2>
        <p>The following examples show how the text (within '&lt;p&gt;&lt;/p&gt;' tags) will appear:</p>
        <p><strong>This is an example of bold text</strong></p>
        <p><i>This is an example of italic text</i></p>
        <p><a href="#">This is a hyperlink</a></p>
        <h2>Lists</h2>
        <p>This is an unordered list:</p>
        <ul>
          <li>Item 1</li>
          <li>Item 2</li>
          <li>Item 3</li>
          <li>Item 4</li>
        </ul>
        <p>This is an ordered list:</p>
        <ol>
          <li>Item 1</li>
          <li>Item 2</li>
          <li>Item 3</li>
          <li>Item 4</li>
        </ol>
        <h2>Images</h2>
        <p>images can be placed on the left, in the center or on the right:</p>
        <span class="left"><img src="style/graphic.png" alt="example graphic" /></span>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum.
        </p>
        <span class="center"><img src="style/graphic.png" alt="example graphic" style="width:400px;height:300px;"/></span>
        <span class="right"><img src="style/graphic.png" alt="example graphic" /></span>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
          irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur.
        </p>
        <h2>Tables</h2>
        <p>Tables should be used to display data and not used for laying out your website:</p>
        <table style="width:100%; border-spacing:0;">
          <tr><th>Item</th><th>Description</th></tr>
          <tr><td>Item 1</td><td>Description of Item 1</td></tr>
          <tr><td>Item 2</td><td>Description of Item 2</td></tr>
          <tr><td>Item 3</td><td>Description of Item 3</td></tr>
          <tr><td>Item 4</td><td>Description of Item 4</td></tr>
        </table> 
        <input type="submit" class="btn btn-default"  value="删除">
      </div>
      
      	
      
       
        
        
        
      </div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>
