<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div id="logo">
	<h1><a href="${basePath}">Blog</a>Hub</h1>
	<div class="slogan">Cool Blog Goes Here!</div>
</div>
