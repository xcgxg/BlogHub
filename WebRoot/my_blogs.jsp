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
  
  <%--载入kindeditor --%>
  	<script type="text/javascript" src="./js/kindeditor/kindeditor-all-min.js"></script>
	<link rel="stylesheet" href="./js/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="./js/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="./js/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="./js/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="./js/kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : './js/kindeditor/plugins/code/prettify.css',
				uploadJson : './kindeditor_file_manager/upload_json.jsp',
				fileManagerJson : './kindeditor_file_manager/file_manager_json.jsp',
				allowFileManager : false,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
	
	<script>
		<c:choose>
			<c:when test="${! empty sessionScope.add_article_page_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("add_article_page_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("add_article_page_info")).get("info"));
					session.removeAttribute("add_article_page_info");
				%>
				$(function () { $('#myBlogsModal').modal('show')});
			</c:when>
			<c:otherwise>
				$(function () { $('#myBlogsModal').modal('hide')});
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${! empty sessionScope.search_articles}">
				<%
					pageContext.setAttribute("search_articles", session.getAttribute("search_articles"));
					session.removeAttribute("search_articles");
				%>
			</c:when>
		</c:choose>
		
	</script>
	
</head>

<body>

	<!-- 模态框（Modal） 写博客-->
	<div class="modal fade" id="addArticleModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width:800px;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">
	            	<c:out value="编辑个人主页"></c:out>
	            </h4>
	         </div>
	         <form action="add_article" method="post">
		         <div class="modal-body">
		         	<div class="form-group">
		         		<input type="text" class="form-control input-md" required placeholder="标题" name="title"/>
		         	</div>
		         	<div class="form-group">
		         		<textarea class="form-control" placeholder="摘要" name="digest"></textarea>
		         	</div>
          			<div class="form-group">
       					<textarea style="width:770px;height:600px;" name="content" >
       						 ;)
       					</textarea>
					</div>        		
		         </div>
	        	 <div class="modal-footer">
		        	 <input type="submit" class="btn btn-primary" name="button" value="提交内容" />
		        	 <input type="button" class="btn btn btn-default" data-dismiss="modal" name="button" value="关闭" />
	        	 </div>
	         </form>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 模态框（Modal） 会话消息-->
	<div class="modal fade" id="myBlogsModal" tabindex="-1" role="dialog" 
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
      <c:import url="sidebar_container.jsp" charEncoding="UTF-8"></c:import>
      <div id="content">
      
        <!-- insert the page content here -->
        <div>
        	<form class="form-group" action="search" method="get" >
        	<label for="userOrArticle"><h3><font color="#FFC125">搜</font><font color="#8DEEEE">索</font><font color="#ADFF2F">类</font><font color="#EE2C2C">型</font></h3></label><br>
        	<div class="input-sm col-sm-3" style="padding-left:0px;">
				<select class="form-control" name="userOrArticle" id="userOrArticle">
					<option value="title">文章标题</option>
					<option value="digest">文章摘要</option>
				</select>
			</div>
			<div class="input-sm col-sm-7">
				<input class="form-control" required type="text" name="search_content"/>
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
				      <h3><font color="#FFC125">搜</font><font color="#8DEEEE">索</font><font color="#EE2C2C">结</font><font color="#ADFF2F">果</font></h3>
				    </td>
				  </tr>
				</table>
				<table class="table table-hover">
					<thead>
		     			<tr>
		     				<th>日期</th>
		     				<th>博客</th>
		     			</tr>
		    		</thead>
	         		<c:if test="${! empty pageScope.search_articles}">
		         		<tbody>
							<c:forEach var="article" items="${pageScope.search_articles}">
								<tr>
									<td>${article.time}</td>
									<td><a href="read_blog?blog_id=${article.id}"><abbr title="${article.digest}">${article.title}</abbr></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
	             </table>
			</fieldset>
        </div>
        
        <c:if test="${! empty sessionScope.user}">
	        <div>
				<fieldset>
					<table style="margin:0px;">
						<tr>
					    	<td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 0px;">
					      		<h3><abbr title="${sessionScope.user.email}"><c:out value="${sessionScope.user.name}"></c:out></abbr><font color="#8DEEEE">的</font><font color="#EE2C2C">博</font><font color="#ADFF2F">客</font></h3>
					    	</td>
					    	<td>
				      		<input id="add_article" name="add_article" data-toggle="modal" data-target="#addArticleModal" 
				      			type="submit" class="btn btn-info" style="height:30px;border:none;margin-top:10px;" value="写东西">
				    		</td>
						</tr>
					</table>
					<table class="table table-hover">
						<thead>
							<tr>
         					  <th>日期</th>
         					  <th>博客</th>
	         				</tr>
         				</thead>
         				<tbody>
         					<c:if test="${! empty sessionScope.articles}">
								<c:forEach var="article" items="${sessionScope.articles}">
									<tr>
										<td>${article.time}</td>
										<td><a href="read_blog?blog_id=${article.id}"><abbr title="${article.digest}">${article.title}</abbr></a></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</fieldset>
	        </div>
        </c:if>
	</div>
	</div>
	
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>
