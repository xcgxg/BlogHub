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

import model.Comment;
import model.User;

@WebServlet("/delete_comment")
public class delete_comment extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public delete_comment() {
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
		int comment_id=Integer.parseInt(request.getParameter("comment_id"));
		User user=(User)request.getSession().getAttribute("user");
		Comment comment=Comment.findOrFail("id", comment_id).get(0);
		
		Map<String, String> delete_comment_info=new HashMap<String, String>();
		
		delete_comment_info.put("title", "删除评论");
		
		if(user!=null)
		{
			if(user.getId()==comment.getUser_id())
			{
				int result=comment.delete();
				
				if(result!=0)
				{
					delete_comment_info.put("info", "删除评论成功!");
				}
				else
				{
					delete_comment_info.put("info", "删除评论失败!");
				}
			}
			else
			{
				delete_comment_info.put("info", "删除评论失败!");
			}
			
			request.getSession().setAttribute("delete_comment_info", delete_comment_info);
			
			response.sendRedirect("read_blog?blog_id="+comment.getArticle_id());
		}
		else
		{
			delete_comment_info.put("info", "请先登录!");
			request.getSession().setAttribute("delete_comment_info", delete_comment_info);
			
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
