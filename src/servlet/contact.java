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

import model.Contact;

@WebServlet("/contact")
public class contact extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public contact() {
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
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String msg=request.getParameter("message");
		Map<String, String> contact_page_info=new HashMap<String, String>();
		contact_page_info.put("title", "联系Bloghub");
		
		if((null!=name)&&(null!=email)&&(null!=msg))
		{
			int result=Contact.add(name, email, msg);
			
			if(0!=result)
			{
				contact_page_info.put("info", "感谢您的宝贵建议!");
			}
			else
			{
				contact_page_info.put("info", "反馈失败,请重新填写!");
			}
		}
		else
		{
			contact_page_info.put("info", "请将信息填写完整!");
		}
		
		request.getSession().setAttribute("contact_page_info", contact_page_info);
		
		response.sendRedirect("contact.jsp");
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
