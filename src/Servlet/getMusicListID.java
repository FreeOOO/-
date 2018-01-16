package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Music;
import Service.GetMusicInfo;

/**
 * Servlet implementation class getMusicListID
 */
@WebServlet("/getMusicListID")
public class getMusicListID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMusicListID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String musicid_list = null;
		if(request.getParameter("musiclistid") != null){
			String musicListId = request.getParameter("musiclistid");
	        musicid_list = GetMusicInfo.getMusicListID(musicListId);
		}else if(request.getParameter("musicid") != null){
			musicid_list = request.getParameter("musicid");
		}
        Map<String,Music> map = GetMusicInfo.getMusicInfo(musicid_list);
        request.setAttribute("infomap", map);
		request.getRequestDispatcher("audioplayer.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
