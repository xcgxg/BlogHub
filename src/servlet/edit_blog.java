package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.User;

@WebServlet("/edit_blog")
public class edit_blog extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public edit_blog() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String title=request.getParameter("title");
		String digest=request.getParameter("digest");
		String content=request.getParameter("content");
		int blog_id=Integer.parseInt(request.getParameter("blog_id"));
		Article article=Article.findOrFail("article_id", blog_id).get(0);
		User user=(User)request.getSession().getAttribute("user");
		Map<String, String> edit_blog_info=new HashMap<String, String>();
		
		edit_blog_info.put("title", "修改博客");
		
		if(user!=null)
		{
			if((null==title)||(null==content))
			{
				edit_blog_info.put("info", "标题和内容不能为空!");
			}
			else
			{
				int result=article.setTitle(title);
				result&=article.setDigest(digest);
				result&=article.setContent(content);
				
				if(0==result)
				{
					edit_blog_info.put("info", "修改博文失败!");
				}
				else
				{
					edit_blog_info.put("info", "修改博文成功!");
				}
			}
			
			request.getSession().setAttribute("edit_blog_info", edit_blog_info);
			
			response.sendRedirect("read_blog?blog_id="+blog_id);
		}
		else
		{
			edit_blog_info.put("info", "请先登录!");
			request.getSession().setAttribute("edit_blog_info", edit_blog_info);
			
			response.sendRedirect("sign.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
