<%@page import="javassist.compiler.Javac"%>
<%@page import="java.lang.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

pageContext.setAttribute("current_menubar", "my_page.jsp",pageContext.SESSION_SCOPE);
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
  <script src="js/jquery-2.2.4.min.js"></script>
  <script src="js/bootstrap.min.js"></script>	
  <script>
  	function editclicked()
  	{
  		document.getElementById("ta").readOnly=false;
	    document.getElementById("save").style.display="block";
  	}
  </script>
</head>

<body>
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
        	<form class="form-group" action="" method="get" >
        	<label for="userOrArticle">搜索类型</label><br>
        	<div class="input-sm col-sm-3" style="padding-left:0px;">
				<select class="form-control" name="userOrArticle" id="userOrArticle">
					<option value="title">文章标题</option>
					<option value="digest">文章摘要</option>
					<option value="user">用户</option>
				</select>
			</div>
			<div class="input-sm col-sm-7">
				<input class="form-control" type="text" name="search_content"/>
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
			      <h3><font color="#FFC125">个</font><font color="#8DEEEE">人</font><font color="#EE2C2C">主</font><font color="#ADFF2F">页</font></h3>
			    </td>
			    <td>
			      <input id="edit" onclick="editclicked()" type="submit" class="btn btn-default" style="height:30px;border:none;margin-top:10px;" value="编辑">
			      
			    </td>
			    <td>
			      <input id="save" type="button" class="btn btn-default"  style="height:30px;border:none;margin-top:10px;display:none;" value="保存">
			    </td>
			  </tr>
			</table>
			
			
			
        <form action="#" method="post">
          <div class="form_settings">
          <p><textarea id="ta" style="width:600px;height:400px; color:#000000;" readOnly  name="name" >李彦宏 
百度 创始人、董事长兼首席执行官 
李彦宏，百度公司创始人、董事长兼首席执行官，全面负责百度公司的战略规划和运营管理。
1991年，李彦宏毕业于北京大学信息管理专业，随后前往美国布法罗纽约州立大学完成计算机科学硕士学位，先后担任道·琼斯公司高级顾问、《华尔街日报》网络版实时金融信息系统设计者，以及国际知名互联网企业——Infoseek公司资深工程师。李彦宏所持有的“超链分析”技术专利，是奠定整个现代搜索引擎发展趋势和方向的基础发明之一。
2000年1月，李彦宏创建了百度。经过十多年的发展，百度已经发展成为全球第二大独立搜索引擎和最大的中文搜索引擎。百度的成功，也使中国成为美国、俄罗斯和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。2005年，百度在美国纳斯达克成功上市，并成为首家进入纳斯达克成分股的中国公司。百度已经成为中国最具价值的品牌之一。
2013年，当选第十二届全国政协委员，兼任第十一届中华全国工商业联合会副主席、第八届北京市科协副主席等职务，并获聘“国家特聘专家”。
2016年3月两会，李彦宏公布了自己的两会提案：一、关于加快制定和完善无人驾驶汽车相关政策法规，抢占产业发展制高点的提案；二是关于支持专网资源投入社会化运营，促进提速降费的提案 ；三是关于完善我国空域资源管理制度，提升民航准点率，推动我国航空事业发展的提案 。
          
          </textarea></p>
          
          </div>
        </form>
		</fieldset>
        </div>
		<h4 style="margin-top:0px;"><b>搜索结果</b></h4>
          <ul>
          <li><a>张三</a></li>
          <li><a>李四</a></li>
          <li><a>王五</a></li>
          <li><a>赵六</a></li>
          </ul>
		
        
        
        
      </div>
    </div>
    
    <c:import url="footer.jsp" charEncoding="UTF-8"></c:import>
    
  </div>
</body>
</html>