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
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="./js/jquery-2.2.4.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>	
  
  	<%--载入kindeditor --%>
  	<script type="text/javascript" src="./js/kindeditor/kindeditor-all-min.js"></script>
	<link rel="stylesheet" href="./js/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="./js/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="./js/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="./js/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="./js/kindeditor/plugins/code/prettify.js"></script>
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
 <script type="text/javascript">
  $(function(){
   $(".aaa").bind("keydown keyup",function(){
    $(this).autosize();
   }).show().autosize();
  });
  
  $.fn.autosize = function(){
   $(this).height('0px');
   var setheight = $(this).get(0).scrollHeight;
   if($(this).attr("_height") != setheight)
    $(this).height(setheight+"px").attr("_height",setheight);
   else
    $(this).height($(this).attr("_height")+"px");
  }

 </script>
	
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
				$(function () { $('#sessionModal').modal('show')});
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
			<c:when test="${! empty sessionScope.delete_comment_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("delete_comment_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("delete_comment_info")).get("info"));
					session.removeAttribute("delete_comment_info");
				%>
				$(function () { $('#sessionModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.add_comment_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("add_comment_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("add_comment_info")).get("info"));
					session.removeAttribute("add_comment_info");
				%>
				$(function () { $('#sessionModal').modal('show')});
			</c:when>
			<c:when test="${! empty sessionScope.delete_blog_info}">
				<%
					pageContext.setAttribute("session_msg_title", ((HashMap<String, String>)session.
						getAttribute("delete_blog_info")).get("title"));
					pageContext.setAttribute("session_msg_info", ((HashMap<String, String>)session.
						getAttribute("delete_blog_info")).get("info"));
					session.removeAttribute("delete_blog_info");
				%>
				$(function () { $('#sessionModal').modal('show')});
			</c:when>
			<c:otherwise>
				$(function () { $('#sessionModal').modal('hide')});
			</c:otherwise>
		</c:choose>
	</script>
	
	<script>
		<c:choose>
			<c:when test="${! empty requestScope.blog_id}">
				<%
					pageContext.setAttribute("blog_id", request.getAttribute("blog_id"));
					request.removeAttribute("blog_id");
				%>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${! empty requestScope.blog}">
				<%
					pageContext.setAttribute("blog", request.getAttribute("blog"));
					request.removeAttribute("blog");
				%>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${! empty requestScope.owner}">
				<%
					pageContext.setAttribute("owner", request.getAttribute("owner"));
					request.removeAttribute("owner");
				%>
			</c:when>
		</c:choose>
		
		<c:choose>
			<c:when test="${! empty requestScope.user_commment}">
				<%
					pageContext.setAttribute("user_commment", request.getAttribute("user_commment"));
					request.removeAttribute("user_commment");
				%>
			</c:when>
		</c:choose>
	</script>

</head>

<body>

	<!-- 模态框（Modal） 修改博客-->
	<div class="modal fade" id="readBlogModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width:800px;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">
	            	<c:out value="编辑博客"></c:out>
	            </h4>
	         </div>
	         <form action="edit_blog" method="post">
		         <div class="modal-body">
		         	<div class="form-group">
		         		<input type="text" class="form-control input-md" required value="${pageScope.blog.title}" name="title"/>
		         	</div>
		         	<div class="form-group">
		         		<textarea class="text-left form-control" name="digest">${pageScope.blog.digest}</textarea>
		         	</div>
          			<div class="form-group">
       					<textarea style="width:770px;height:600px;" name="content" >
       						 <c:out value="${pageScope.blog.content}" escapeXml="false"></c:out>
       					</textarea>
					</div>        		
		         </div>
	        	 <div class="modal-footer">
	        	 	<input type="hidden" name="blog_id" value="${pageScope.blog_id}"/>
		        	 <input type="submit" class="btn btn-primary" name="button" value="提交内容" />
		        	 <input type="button" class="btn btn btn-default" data-dismiss="modal" name="button" value="关闭" />
	        	 </div>
	         </form>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 模态框（Modal） 添加评论-->
	<div class="modal fade" id="makeCommentModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width:400px;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="myModalLabel">
	            	<c:out value="添加评论"></c:out>
	            </h4>
	         </div>
	         <form action="add_comment" method="post">
		         <div class="modal-body">
          			<div class="form-group">
       					<textarea style="width:368px;height:200px;" placeholder="说点什么~"name="makeComment" ></textarea>
					</div>
		         </div>
	        	 <div class="modal-footer">
	        	 	 <input type="hidden" name="blog_id" value="${pageScope.blog_id}"/>
		        	 <input type="submit" class="btn btn-primary" name="button" value="提交内容" />
		        	 <input type="button" class="btn btn btn-default" data-dismiss="modal" name="button" value="关闭" />
	        	 </div>
	         </form>
	      </div><!-- /.modal-content -->
	   </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 模态框（Modal） 会话消息-->
	<div class="modal fade" id="sessionModal" tabindex="-1" role="dialog" 
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

  <div id="main" style="height:auto;">
    <div id="header">
      <c:import url="logo.jsp"></c:import>
      <c:import url="menubar.jsp"></c:import>
    </div>
    <div id="site_content">
    	<c:import url="sidebar_container.jsp" charEncoding="UTF-8"></c:import>
      	<div id="content" >                
			<div>
				<fieldset>
					<table style="margin:0px;">
						<tr>
							<td colspan="3" style="padding-top:0px;padding-bottom:0px;padding-left:0px;">
								<h1 style="margin:0px;"><b>${pageScope.blog.title}</b></h1>
							</td>
							
							
							<c:if test="${! empty sessionScope.user}">
				    			<c:if test="${sessionScope.user.id==pageScope.owner.id}">
						    		<td style="text-align:right;padding-top:0px;padding-bottom:0px;">
						      			<input id="edit" name="edit" data-toggle="modal" data-target="#readBlogModal" 
						      				type="submit" class="btn btn-info" style="height:30px;border:none;margin-top:10px;" value="编辑">
						    		</td>
						    		<td style="text-align:right;padding-top:0px;padding-bottom:0px;">
							    		<form class="form-group" action="delete_blog" method="post" style="margin-bottom:0px;">
							    			<input type="hidden" name="blog_id" value="${pageScope.blog_id}"/>
							      			<input  name="delete" type="submit" class="btn btn-danger" style="height:30px;border:none;margin-top:10px;" value="删除">
							    		</form>
						    		</td>
					    		</c:if>
				   			</c:if>
						</tr>
						
				  		<tr>
				  			
				    		<td style="padding-top: 0px;padding-bottom: 0px;padding-left:0px; width:50px;height:30px;">
				      			<h4><a href="other_page?other_id=${pageScope.owner.id}"><abbr title="${pageScope.owner.email}"><small>${pageScope.owner.name}</small></abbr></a></h4>
				    		</td>
				    		<td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;width:240px;height:30px;">
				      			<h4><small>${pageScope.blog.time}</small></h4>
				    		</td>
				    		<td style="width:400px;padding-top:0px;padding-bottom:0px;height:30px;"></td>
				    		<td style="width:60px;padding-top:0px;padding-bottom:0px;height:30px;"></td>
				    		<td style="width:60px;padding-top:0px;padding-bottom:0px;height:30px;"></td>
				  		</tr>
				  		<tr>
				  			<td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;width:240px;height:30px;">
				  				<h4><small>摘要: </small></h4>${pageScope.blog.digest}
				  			</td>
				  		</tr>
				  	
					</table>
					<hr>
					<div>
						<form class="form-group">
		         			<div class="form-group">
		          				<c:out value="${pageScope.blog.content}" escapeXml="false"></c:out>
		         	 		</div>
	         	 		</form>
         	 		</div>
         	 		
         	 		<hr>
         	 		
         	 		<table style="margin:0px;">
				  		<tr>
				    		<td style="padding-top: 0px;padding-right: 10px;padding-bottom: 0px;padding-left: 0px;">
				      			<h3><font color="#FFC125">评</font><font color="#8DEEEE">论</font></h3>
				    		</td>
				    		<c:if test="${! empty sessionScope.user}">
					    		<td>
					      			<input id="edit" name="edit" data-toggle="modal" data-target="#makeCommentModal" 
					      				type="submit" class="btn btn-info" style="height:30px;border:none;margin-top:10px;" value="写评论">
					    		</td>
				   			</c:if>
				  		</tr>
					</table>
         	 		<c:forEach var="u_c_item" items="${pageScope.user_commment}">
         	 			<form action="delete_comment" method="post">
         	 				<textarea class="form-control" readonly style="width:600px;margin-bottom:0px;overflow:hidden;">	
         	 					${u_c_item.key.message}
         	 				</textarea>
         	 				<c:if test="${! empty sessionScope.user}">
				    			<c:if test="${sessionScope.user.id==u_c_item.key.user_id}">
				    				<input type="hidden" name="comment_id" value="${u_c_item.key.id}">
         	 						<input class="btn btn-danger" type="submit" value="删除" style="margin-bottom:10px;height:30px;font-size:12px;">
         	 					</c:if>
				   			</c:if>
         	 			</form>
         	 			<hr>
         	 		</c:forEach>
				</fieldset>
	        </div>
		</div>
	</div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>