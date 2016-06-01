package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DB;
import util.Hash;
import util.JDBC;
import util.TypesOfEncry;
import model.User;

@WebServlet("/signin")
public class signin extends HttpServlet implements TypesOfEncry{

	/**
	 * Constructor of the object.
	 */
	public signin() {
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
		User user=User.findOrFail((String)request.getParameter("name"));
		Map<String, String> signin_up_info=new HashMap<String, String>();
		
		signin_up_info.put("title", "登录信息");
		
		if(user!=null)
		{
			String pwdHash=Hash.getHash(request.getParameter("password"), SHA1);
			
			if(pwdHash.equals(user.getPassword()))
			{
				signin_up_info.put("info", "登录成功!");
				request.getSession().setAttribute("signin_up_info", signin_up_info);
				request.getSession().setAttribute("user", user);
				
				response.sendRedirect("index.jsp");
			}
			else
			{
				signin_up_info.put("info", "密码错误!");
				request.getSession().setAttribute("signin_up_info", signin_up_info);
				
				response.sendRedirect("sign.jsp");
			}
		}
		else
		{
			signin_up_info.put("info", "用户名或密码错误!");
			request.getSession().setAttribute("signin_up_info", signin_up_info);
			
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
