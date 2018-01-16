package Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.Comment;
import Dao.Music;
import Service.CommentInfo;
import Service.GetMusicInfo;

/**
 * Servlet implementation class getMusicList
 */
@WebServlet("/getMusicList")
public class getMusicList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMusicList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String musicListId = request.getParameter("musiclistid");
//System.out.println(musicListId);
		String musicid_list = GetMusicInfo.getMusicListID(musicListId);
		String musicListName = GetMusicInfo.getMusicListName(musicListId);
		String musicListCreateDate = GetMusicInfo.getMusicListCreateDate(musicListId);
        Map<String,Music> map = GetMusicInfo.getMusicInfo(musicid_list);
        List<Comment> list = CommentInfo.getMusicListComment(musicListId);
        request.setAttribute("commonlist", list);
        request.setAttribute("infomap", map);
        request.setAttribute("listId", musicListId);
        request.setAttribute("listName", musicListName);
        request.setAttribute("createDate", musicListCreateDate);
		request.getRequestDispatcher("MusicPlay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
