package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Service.GetMusicInfo;
import Service.Login;
import Service.Register;

/**
 * Servlet implementation class getRegisterData
 */
@WebServlet("/getRegisterData")
public class getRegisterData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getRegisterData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("Username");
		String pwd1 = request.getParameter("pwd1");
		String email = request.getParameter("Email");
		if(Login.isExist(email)){
			request.setAttribute("msg", "该邮箱已注册");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else{
			Register register = new Register();
			register.addUser(userid, pwd1, email);
			GetMusicInfo.addMusicList("我的歌单", Login.getUserId(email));
			HttpSession session = request.getSession();
			session.setAttribute("user_id", Login.getUserId(email));
			session.setAttribute("user_name", Login.getUserName(email));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
