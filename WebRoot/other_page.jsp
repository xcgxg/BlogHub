<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "my_page.jsp",pageContext.SESSION_SCOPE);
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
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="./js/jquery-2.2.4.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  
	<script>
		<c:choose>
			<c:when test="${! empty requestScope.other}">
				<%
					pageContext.setAttribute("other", request.getAttribute("other"));
					request.removeAttribute("other");
				%>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${! empty requestScope.other_articles}">
				<%
					pageContext.setAttribute("other_articles", request.getAttribute("other_articles"));
					request.removeAttribute("other_articles");
				%>
			</c:when>
		</c:choose>
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
        	<c:if test="${! empty pageScope.other}">
	        	<div>
	        		<fieldset>
						<table style="margin:0px;">
				 		 <tr>
				   		 	<td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 0px;">
				      			<h3><abbr title="${pageScope.other.email}">${pageScope.other.name}"></abbr><font color="#8DEEEE">的</font><font color="#EE2C2C">主</font><font color="#ADFF2F">页</font></h3>
				   			 </td>
				  		</tr>
						</table>
	          			<div class="form_settings">
	          				<c:out value="${pageScope.other.introduction}" escapeXml="false"></c:out>
	          			</div>
					</fieldset>
				</div>
				
				<h3><font color="#FFC125">博</font><font color="#8DEEEE">客</font></h3>
				
				<table class="table table-hover">
					<thead>
						<tr>
        					  <th>日期</th>
        					  <th>博客</th>
         				</tr>
        			</thead>
       				<tbody>
       					<c:if test="${! empty pageScope.other_articles}">
							<c:forEach var="article" items="${pageScope.other_articles}">
								<tr>
									<td>${article.time}</td>
									<td><a href="read_blog?blog_id=${article.id}"><abbr title="${article.digest}">${article.title}</abbr></a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</c:if>
      	</div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>