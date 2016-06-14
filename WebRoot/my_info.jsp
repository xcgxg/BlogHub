<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "my_info.jsp",pageContext.SESSION_SCOPE);
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
	  document.getElementById("password").disabled=(document.getElementById("password").disabled==true?false:true);
	  document.getElementById("email").disabled=(document.getElementById("email").disabled==true?false:true);
	  document.getElementById("sure").style.display=(document.getElementById("sure").style.display=="block"?"none":"block");
	  document.getElementById("surepassword").style.display=(document.getElementById("surepassword").style.display=="block"?"none":"block");
	  document.getElementById("surepassword").disabled=(document.getElementById("surepassword").disabled==true?false:true);
	  document.getElementById("password").autofocus="autofocus";
 	}
 
  </script>
  
  <script>
		<c:if test="${empty sessionScope.user}">
			<c:redirect url="sign.jsp"/>
		</c:if>
	</script>
  
  <script>
		<c:choose>
			<c:when test="${! empty sessionScope.mod_personal_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("mod_personal_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("mod_personal_info")).get("info"));
					session.removeAttribute("mod_personal_info");
				%>
				$(function () { $('#personalInfoModal').modal('show')});
			</c:when>
			<c:otherwise>
				$(function () { $('#personalInfoModal').modal('hide')});
			</c:otherwise>
		</c:choose>
	</script>
	
</head>

<body>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="personalInfoModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" 
	               aria-hidden="true">
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
    	<div id="content">
    	  <div style="width:850px; margin-left:20px;">
        	   <fieldset>
        	     <legend><h3><font color="#FFC125">个</font><font color="#8DEEEE">人</font><font color="#EE2C2C">信</font><font color="#ADFF2F">息</font></h3></legend>
        	   <table >
        	     <tr>
        	       <td style="vertical-align: text-top;">
        	       
        	         <table style="margin-top:0px;margin-bottom:0px;">
		            <tr>
		              <td>
		                <div class="form-group input-md">
					      <img alt="" src="images/1.jpg"/>
				    	</div>
		              </td>
		              <td>
		                <div class="form-group input-md" >		   	  
	        		      <h4><abbr title="${sessionScope.user.email}">${sessionScope.user.name}</abbr></h4>
	        		      <h5>注册时间: ${sessionScope.user.time}</h5>		
						</div>
		              </td>
		            </tr>
		          </table>	
        		<form class="form-group" method="post" action="mod_personal_info" style="left:100px;">
					  <label style="font-size:16px;"><b>密码:</b></label><input id="password" class="form-control" placehholder="新密码" disabled name="password" type="password" style="width:300px;"/>
					  	<label id="sure" style="font-size:16px;display:none"><b>确认密码:</b></label><input id="surepassword" placehholder="确认密码" class="form-control" disabled name="password_confirm" type="password" style="width:300px;display:none;"/>						
			  		  <label style="font-size:16px;"><b>邮箱:</b></label><input id="email" class="form-control" type="email" value="${sessionScope.user.email}"  disabled name="email"  style="width:300px;"/><br/>
				      
					  <input id="edit" type="button" onclick="editclicked()" class="btn btn-default" value="编辑" style="width:147px;"/> 
					  <input  id = "save" type="submit" class="btn btn-default" value="保存" style="width:147px;"/>
					  <input  formaction="logout" formmethod="post" type="submit" class="btn btn-danger" value="退出" style="width:147px;margin-top:20px;"/>  	
				</form>
        	       </td>
        	       <td style="vertical-align:text-top;">
        	         <div style="width:500px;margin-left:50px; ">
        	         	
	        			<h4><abbr title="${sessionScope.user.email}"><c:out value="${sessionScope.user.name}"></c:out></abbr><font color="#8DEEEE">的</font><font color="#EE2C2C">博</font><font color="#ADFF2F">客</font></h4>
	  					<table class="table table-hover">
	  						<thead>
	          					<tr>
	          					  <th>日期</th>
	          					  <th>博客</th>
	          					</tr>
          					</thead>
         					<c:if test="${! empty sessionScope.articles}">
         						<tbody>
									<c:forEach var="article" items="${sessionScope.articles}">
										<tr>
											<td>${article.time}</td>
											<td><a href="read_blog?blog_id=${article.id}"><abbr title="${article.digest}">${article.title}</abbr></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
                		</table>
					 </div>
        	       </td>
        	     </tr>
        	   </table>
        	   </fieldset>
        	 </div> 	  
 	  </div>
</div>
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>
