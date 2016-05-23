<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div id="sidebar_container">
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
		<form method="post" action="">
			<h3>Login</h3>
			<div class="form-group">
				<label>Name</label><input type="text" name="name">
			</div>
			<div class="form-group">
				<label>PassWord</label><input type="password" name="password">
			</div>
			<input type="submit" value="Login"/>
		</form>
	</div>
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
	  <h3>Newsletter</h3>
	  <p>If you would like to receive our newletter, please enter your email address and click 'Subscribe'.</p>
	  <form method="post" action="#" id="subscribe">
	    <p style="padding: 0 0 9px 0;"><input class="search" type="text" name="email_address" value="your email address" onclick="javascript: document.forms['subscribe'].email_address.value=''" /></p>
	    <p><input class="subscribe" name="subscribe" type="submit" value="Subscribe" /></p>
	  </form>
	</div>
	<img class="paperclip" src="style/paperclip.png" alt="paperclip" />
	<div class="sidebar">
	  <h3>Latest Blog</h3>
	  <h4>Website Goes Live</h4>
	  <h5>1st July 2011</h5>
	  <p>We have just launched our new website. Take a look around, we'd love to know what you think.....<br /><a href="#">read more</a></p>
	</div>
</div>
