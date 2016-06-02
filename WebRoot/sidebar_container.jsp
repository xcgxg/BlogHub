<%@ page language="java" import="java.util.*" import="java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sidebar_container">
	<div class="sidebar" style="width:250px;">
		<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
		
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<form class="form-group" method="post" action="signin">
					<h3><font color="#FF8C00">登</font><font color="#CAFF70">录</font></h3>
					<div class="form-group input-md">
						<label>用户名</label><input required="required" class="form-control" type="text" name="name">
					</div>
					<div class="form-group input-md">
						<label>密码</label><input required="required" class="form-control" type="password" name="password">
					</div>
					<input class="btn btn-default" type="submit" value="登录"/> or <a href="sign.jsp">注册</a>
				</form>
			</c:when>
			<c:otherwise>
				<h3><font color="#FF8C00">Blog</font><font color="#CAFF70">er</font></h3>
				<p>Hi! <a href="my_info.jsp"><strong><c:out value="${sessionScope.user.name}"></c:out></strong></a>~</p>
				<p>几天心情如何? <a href="my_blogs.jsp">写点什么吧~</a></p>
				<p><a href="logout">登出</a></p>
			 </c:otherwise>
		</c:choose>
	</div>
	<div class="sidebar" style="width:250px;">
	  <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	  <h3><font color="#EE2C2C">新</font><font color="#FFC125">鲜</font><font color="#ADFF2F">事</font><font color="#8DEEEE">儿</font></h3>
	  <p>这里是我们BlogHub的新鲜事儿</p>
	  <p>我们的BlogHub正在建设中</p>
	</div>
	<div class="sidebar" style="width:250px;">
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	  <h3><font color="#FFC125">新</font><font color="#8DEEEE">博</font><font color="#EE2C2C">速</font><font color="#ADFF2F">递</font></h3>
	  <h5><%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date()) %></h5>
	  <p>We have just launched our new website. Take a look around, we'd love to know what you think.....<br /><a href="#">read more</a></p>
	</div>
</div>
