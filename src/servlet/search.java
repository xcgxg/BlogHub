package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Article;
import model.User;

@WebServlet("/search")
public class search extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public search() {
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
		request.setCharacterEncoding("utf-8");
		String userOrArticle=request.getParameter("userOrArticle");
		String content=request.getParameter("search_content");
		Map<String, String> search_info=new HashMap<String, String>();
		
		search_info.put("title", "搜索结果");
		
		if((userOrArticle!=null)&&(content!=null))
		{
			if(userOrArticle.equals("user"))
			{
				User search_user=(User)User.findOrFail(content);
				
				request.getSession().setAttribute("search_user", search_user);
				
				response.sendRedirect("my_page.jsp");
			}
			else if(userOrArticle.equals("title")||userOrArticle.equals("digest"))
			{
				ArrayList<Article> search_articles=Article.findOrFail(userOrArticle, content);
				request.getSession().setAttribute("search_articles", search_articles);
				
				response.sendRedirect("my_blogs.jsp");
			}
			else
			{
				search_info.put("info", "搜索方式错误!");
				request.getSession().setAttribute("search_info", search_info);
				
				response.sendRedirect("index.jsp");
			}
		}
		else
		{
			search_info.put("info", "搜索内容不能为空!");
			request.getSession().setAttribute("search_info", search_info);
			
			response.sendRedirect("index.jsp");
		}
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
		this.doGet(request, response);
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
