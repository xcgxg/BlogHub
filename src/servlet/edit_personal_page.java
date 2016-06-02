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

import model.User;

@WebServlet("/edit_personal_page")
public class edit_personal_page extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public edit_personal_page() {
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
		String introduction=request.getParameter("introduction");
		Map<String, String> edit_personal_page_info=new HashMap<String, String>();
		edit_personal_page_info.put("title", "修改个人主页信息");
		
		if(user!=null)
		{
			int result=user.setIntroduction(introduction);
			
			if(0==result)
			{
				edit_personal_page_info.put("info", "修改失败!");
			}
			else
			{
				edit_personal_page_info.put("info", "修改成功!");
			}
			
			request.getSession().setAttribute("edit_personal_page_info", edit_personal_page_info);
			
			response.sendRedirect("my_page.jsp");
		}
		else
		{
			edit_personal_page_info.put("info", "修改失败,请先登录!");
			request.getSession().setAttribute("edit_personal_page_info", edit_personal_page_info);
			
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
