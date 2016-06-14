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

@WebServlet("/delete_blog")
public class delete_blog extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public delete_blog() {
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
		int blog_id=Integer.parseInt(request.getParameter("blog_id"));
		User user=(User)request.getSession().getAttribute("user");
		Article article=Article.findOrFail("id", blog_id).get(0);
		Map<String, String> delete_blog_info=new HashMap<String, String>();
		
		delete_blog_info.put("title", "删除博文");
		
		if(user!=null)
		{
			if(user.getId()==article.getUser_id())
			{
				int result=article.delete();
				
				if(result!=0)
				{
					delete_blog_info.put("info", "删除博文成功!");
				}
				else
				{
					delete_blog_info.put("info", "删除博文失败!");
				}
			}
			else
			{
				delete_blog_info.put("info", "删除博文失败!");
			}
			
			request.getSession().setAttribute("articles", Article.findOrFail("user_id", user.getId()));
			request.getSession().setAttribute("delete_blog_info", delete_blog_info);
			
			response.sendRedirect("my_blogs.jsp");
		}
		else
		{
			delete_blog_info.put("info", "请先登录!");
			request.getSession().setAttribute("delete_blog_info", delete_blog_info);
			
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
