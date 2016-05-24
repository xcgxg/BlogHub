<%@ page language="java" import="java.util.*" import="java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sidebar_container">
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
		<form class="form-group" method="post" action="">
			<h3><font color="#FF8C00">登</font><font color="#CAFF70">录</font></h3>
			<div class="form-group">
				<label>用户名</label><input type="text" name="name">
			</div>
			<div class="form-group">
				<label>密码</label><input type="password" name="password">
			</div>
			<input class="btn btn-default" type="submit" value="Sign in"/> or <a href="">注册</a>
		</form>
		
		<!-- 
			<p>Hi! <a href=""><strong>用户名~</strong></a></p>
			<p>几天心情如何? <a href="">写点什么吧~</a></p>
		 -->
	</div>
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
	  <h3><font color="#EE2C2C">新</font><font color="#FFC125">鲜</font><font color="#ADFF2F">事</font><font color="#8DEEEE">儿</font></h3>
	  <p>这里是我们BlogHub的新鲜事儿</p>
	  <p>我们的BlogHub正在建设中</p>
	</div>
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
	  <h3><font color="#FFC125">新</font><font color="#8DEEEE">博</font><font color="#EE2C2C">速</font><font color="#ADFF2F">递</font></h3>
	  <h5><%=DateFormat.getDateInstance(DateFormat.FULL).format(new Date()) %></h5>
	  <p>We have just launched our new website. Take a look around, we'd love to know what you think.....<br /><a href="#">read more</a></p>
	</div>
</div>
