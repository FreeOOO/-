package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MusicList;
import Service.GetMusicInfo;

/**
 * Servlet implementation class addMusicToList
 */
@WebServlet("/showUserMusicList")
public class showUserMusicList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showUserMusicList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//String musicid = request.getParameter("musicId");
		String musicid = request.getParameter("musicId");
		String userid = (String) request.getSession().getAttribute("user_id");
		List<MusicList> list = GetMusicInfo.getUserList(userid);
		request.setAttribute("list", list);
		request.setAttribute("musicid", musicid);
		request.getRequestDispatcher("AddMusicToList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
