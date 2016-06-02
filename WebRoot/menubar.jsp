<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<input type="hidden" id="current_menubar" value="${current_menubar}" />
<div id="menubar">
	<ul id="menu">
		<li id="index.jsp"><a href="index.jsp">Home</a></li>
		<li id="my_page.jsp">
			<a href="my_page.jsp">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						Page
					</c:when>
					<c:otherwise>
						My Page
					</c:otherwise>			
				</c:choose>
			</a>
		</li>
		<li id="my_blogs.jsp">
			<a href="my_blogs.jsp">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						Blogs
					</c:when>
					<c:otherwise>
						My Blogs
					</c:otherwise>			
				</c:choose>
			</a>
		</li>
		<li id="my_info.jsp">
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<a href="sign.jsp">Signin/up</a></li>
				</c:when>
				<c:otherwise>
					<a href="my_info.jsp">My Info</a></li>
				</c:otherwise>			
			</c:choose>
		</li>
		<li id="contact.jsp"><a href="contact.jsp">Contact BH</a></li>
	</ul>
</div>

<script>
	document.getElementById(document.getElementById("current_menubar").value)
		.setAttribute("class", "current");
</script>