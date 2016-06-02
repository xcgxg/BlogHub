<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to BlogHub!</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<%--载入kindeditor --%>
	<%-- 
	<script type="text/javascript" src="./js/kindeditor/kindeditor-all-min.js"></script>
	
	<link rel="stylesheet" href="./js/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="./js/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="./js/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="./js/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="./js/kindeditor/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : './js/kindeditor/plugins/code/prettify.css',
				uploadJson : './kindeditor_file_manager/upload_json.jsp',
				fileManagerJson : './kindeditor_file_manager/file_manager_json.jsp',
				allowFileManager : true,
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
	--%>
	
  </head>
  
  <body>
    This is BlogHub's Welcome Page. <br>
    
    <%--使用kindeditor的textarea --%>
    <%-- 
    <form method="post" action="editor">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">
		</textarea>
		<br>
		<input type="submit" name="button" value="提交内容" />
	</form>
	--%>
	
  </body>
</html>
