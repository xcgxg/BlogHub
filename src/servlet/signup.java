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

@WebServlet("/signup")
public class signup extends HttpServlet implements TypesOfEncry{

	/**
	 * Constructor of the object.
	 */
	public signup() {
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
		String name=request.getParameter("name");
		String pwd=request.getParameter("password");
		String pwd_cf=request.getParameter("password_confirm");
		String email=request.getParameter("email");
		
		Map<String, String> signin_up_info=new HashMap<String, String>();
		signin_up_info.put("title", "注册信息");
		
		if(null==name)
		{
			signin_up_info.put("info", "用户名为空!");
			request.getSession().setAttribute("signin_up_info", signin_up_info);
			
			response.sendRedirect("sign.jsp");
		}
		else if((null==pwd)||(null==pwd_cf))
		{
			signin_up_info.put("info", "密码为空!");
			request.getSession().setAttribute("signin_up_info", signin_up_info);
			
			response.sendRedirect("sign.jsp");
		}
		else if(!pwd.equals(pwd_cf))
		{
			signin_up_info.put("info", "密码不一致!");
			request.getSession().setAttribute("signin_up_info", signin_up_info);
			
			response.sendRedirect("sign.jsp");
		}
		else
		{
			int result=User.add(name, email, null, Hash.getHash(pwd, SHA1));
			
			if(0==result)
			{
				signin_up_info.put("info", "注册失败!");
				request.getSession().setAttribute("signin_up_info", signin_up_info);
				
				response.sendRedirect("sign.jsp");
			}
			else
			{
				signin_up_info.put("info", "注册成功!");
				request.getSession().setAttribute("signin_up_info", signin_up_info);
				
				response.sendRedirect("index.jsp");
			}
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
