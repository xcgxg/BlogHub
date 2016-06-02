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
import model.Comment;
import model.User;

@WebServlet("/add_comment")
public class add_comment extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public add_comment() {
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
		String comment_msg=request.getParameter("makeComment");
		int blog_id=Integer.parseInt(request.getParameter("blog_id"));
		User user=(User)request.getSession().getAttribute("user");
		Article article=Article.findOrFail("article_id", blog_id).get(0);
		Map<String, String> add_comment_info=new HashMap<String, String>();
		
		add_comment_info.put("title", "添加评论");
		
		if(user!=null)
		{
			int result=Comment.add(article.getId(), user.getId(), comment_msg);
			
			if(result!=0)
			{
				add_comment_info.put("info", "添加评论成功!");
			}
			else
			{
				add_comment_info.put("info", "添加评论失败!");
			}
			
			request.getSession().setAttribute("add_comment_info", add_comment_info);
			
			response.sendRedirect("read_blog?blog_id="+blog_id);
		}
		else
		{
			add_comment_info.put("info", "清先登录!");
			request.getSession().setAttribute("add_comment_info", add_comment_info);
			
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
