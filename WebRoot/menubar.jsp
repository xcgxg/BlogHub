<div id="menubar">
	<input type="hidden" id="current_menubar" value="${current_menubar}" />
	<ul id="menu">
		<li id="index.jsp"><a href="index.jsp">Home</a></li>
		<li id="my_page.jsp"><a href="my_page.jsp">My Page</a></li>
		<li id="my_blogs.jsp"><a href="my_blogs.jsp">My Blogs</a></li>
		<li id="my_info.jsp"><a href="my_info.jsp">My Info</a></li>
		<li id="contact.jsp"><a href="contact.jsp">Contact BH</a></li>
	</ul>
</div>

<script>
	document.getElementById(document.getElementById("current_menubar").value)
		.setAttribute("class", "current");
</script>