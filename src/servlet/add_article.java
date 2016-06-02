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

@WebServlet("/add_article")
public class add_article extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public add_article() {
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
		User user=(User)request.getSession().getAttribute("user");
		String title=request.getParameter("title");
		String digest=request.getParameter("digest");
		String content=request.getParameter("content");
		Map<String, String> add_article_page_info=new HashMap<String, String>();
		
		add_article_page_info.put("title", "添加博文");
		
		if(user!=null)
		{
			if((null==title)||(null==content))
			{
				add_article_page_info.put("info", "标题和内容不能为空!");
			}
			else
			{
				int result=Article.add(user.getId(), title, digest, content);
				
				if(0==result)
				{
					add_article_page_info.put("info", "添加博文失败!");
				}
				else
				{
					request.getSession().setAttribute("articles", Article.findOrFail("user_id", user.getId()));
					add_article_page_info.put("info", "添加博文成功!");
				}
			}
			
			request.getSession().setAttribute("add_article_page_info", add_article_page_info);
			
			response.sendRedirect("my_blogs.jsp");
		}
		else
		{
			add_article_page_info.put("info", "请先登录!");
			request.getSession().setAttribute("add_article_page_info", add_article_page_info);
			
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
