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

import util.Hash;
import util.TypesOfEncry;
import model.User;

@WebServlet("/mod_personal_info")
public class mod_personal_info extends HttpServlet implements TypesOfEncry{

	/**
	 * Constructor of the object.
	 */
	public mod_personal_info() {
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
		String pwd=request.getParameter("password");
		String pwd_cf=request.getParameter("password_confirm");
		String email=request.getParameter("email");
		User user=(User)request.getSession().getAttribute("user");
		
		Map<String, String> mod_personal_info=new HashMap<String, String>();
		
		mod_personal_info.put("title", "修改个人信息");
		
		if(user!=null)
		{
			if((null==pwd)||(null==pwd_cf))
			{
				mod_personal_info.put("info", "密码为空!");
				request.getSession().setAttribute("mod_personal_info", mod_personal_info);
				
				response.sendRedirect("my_info.jsp");
			}
			else if(!pwd.equals(pwd_cf))
			{
				mod_personal_info.put("info", "密码不一致!");
				request.getSession().setAttribute("mod_personal_info", mod_personal_info);
				
				response.sendRedirect("my_info.jsp");
			}
			else
			{
				int result=0;
				
				result=user.setPassword(Hash.getHash(pwd, SHA1));
				result&=user.setEmail(email);
				
				if(0==result)
				{
					mod_personal_info.put("info", "修改失败!");
					request.getSession().setAttribute("mod_personal_info", mod_personal_info);
					
					response.sendRedirect("my_info.jsp");
				}
				else
				{
					mod_personal_info.put("info", "修改成功!");
					request.getSession().setAttribute("mod_personal_info", mod_personal_info);
					
					response.sendRedirect("my_info.jsp");
				}
			}
		}
		else
		{
			mod_personal_info.put("info", "修改失败!");
			request.getSession().setAttribute("mod_personal_info", mod_personal_info);
			
			response.sendRedirect("my_info.jsp");
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
