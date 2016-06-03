<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  pageContext.setAttribute("current_menubar", "my_info.jsp",PageContext.SESSION_SCOPE);
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Sign In or Sign Up</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="description" content="website description" />
  	<meta name="keywords" content="website keywords, website keywords" />
	
	<link rel="stylesheet" type="text/css" href="css/Tangerine.css" />
  	<link rel="stylesheet" type="text/css" href="css/Yanone_Kaffeesatz.css" />
  	<link rel="stylesheet" type="text/css" href="style/style.css" />
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script>
		<c:choose>
			<c:when test="${! empty sessionScope.signin_up_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("signin_up_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("signin_up_info")).get("info"));
					session.removeAttribute("signin_up_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.delete_comment_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("delete_comment_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("delete_comment_info")).get("info"));
					session.removeAttribute("delete_comment_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.add_article_page_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("add_article_page_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("add_article_page_info")).get("info"));
					session.removeAttribute("add_article_page_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.add_comment_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("add_comment_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("add_comment_info")).get("info"));
					session.removeAttribute("add_comment_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.edit_blog_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("edit_blog_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("edit_blog_info")).get("info"));
					session.removeAttribute("edit_blog_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.delete_blog_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("delete_blog_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("delete_blog_info")).get("info"));
					session.removeAttribute("delete_blog_info");
				%>
				$(function () { $('#signModal').modal('show')});
			</c:when>
			<c:otherwise>
				$(function () { $('#signModal').modal('hide')});
			</c:otherwise>
		</c:choose>
	</script>

  </head>
  
  <body>
  
  	<!-- 模态框（Modal） -->
	<div class="modal fade" id="signModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" 
	               aria-hidden="true">&times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	            	<c:out value="${pageScope.session_msg_title}"></c:out>
	            </h4>
	         </div>
	         <div class="modal-body">
	         	<c:out value="${pageScope.session_msg_info}"></c:out>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-primary" data-dismiss="modal">
	            	关闭
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
  
    <div id="main">
      <div id="header">
      	<c:import url="logo.jsp"></c:import>
      	<c:import url="menubar.jsp"></c:import> 
      </div>
      <div id="site_content">
    	<div id="content" >
          <table>
        	<tr>
        	  <td style="width:500px;">
        		<div  class="sidebar" style="width:500px; flow:left;">
        	      <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
					<form class="form-group" method="post" action="signin">
			          <h3><font color="#FF8C00">登</font><font color="#CAFF70">录</font></h3>
					  <table>
					    <tr>
					   	  <td>
						    <div class="form-group input-md">
						   	  <img alt="" src="images/1.jpg"/>
							</div>
						  </td>
						  <td>
						    <div class="form-group input-md">
						   	  <br/>
							  <br/>
	        				  <input id="name" required="required" class="form-control" type="text" name="name" placeholder="用户名" style="width:300px;"/>				
							</div>
						    <div class="form-group input-md">	
							  <input id="password" required="required" class="form-control" type="password" name="password" placeholder="密码" style="width:300px;"/>		
							</div>
						    <div class="form-group">
							  <input type="submit" class="btn btn-default" value="登录" style="width:150px;"/> 
							</div>
						  </td>
						</tr>
				      </table>
					</form>
        	    </div>
        	  </td>
        	  <td style="width:360px;">
         		<div  class="sidebar" style="width:360px; flow:left;">
        	      <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
			      <form class="form-group" method="post" action="signup">
			   		<h3><font color="#FF8C00">注</font><font color="#CAFF70">册</font></h3>
					<div class="form-group input-md">
					  <br/>
	        	  	  <input id="name" required="required" class="form-control" type="text" name="name" placeholder="用户名" style="width:300px;"/>				
			   		</div>
			        <div class="form-group input-md">	
			          <input id="password" required="required" class="form-control" type="password" name="password" placeholder="密码" style="width:300px;"/>		
			    	</div>
			        <div class="form-group input-md">	
					  <input id="password_confirm" required="required" class="form-control" type="password" name="password_confirm" placeholder="确认密码" style="width:300px;"/>		
			   		</div>
			 		<div class="form-group input-md">
					  <input id="email" class="form-control" type="email" name="email" placeholder="邮箱" style="width:300px;"/>
					</div>
					<div class="form-group">
					  <input type="submit" class="btn btn-default" value="注册" style="width:150px;"/> 
					</div>
				  </form>
        		</div>
        	  </td>
        	</tr>
          </table>
		</div>
 	  </div>
	  <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
	</div>
  </body>
</html>
