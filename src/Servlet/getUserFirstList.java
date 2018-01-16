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
import Dao.MusicList;
import Service.CommentInfo;
import Service.GetMusicInfo;

/**
 * Servlet implementation class getUserFirstList
 */
@WebServlet("/getUserFirstList")
public class getUserFirstList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserFirstList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		if(request.getSession().getAttribute("user_id") != null){
			String musicListId = GetMusicInfo.getUserFiresList(request.getSession().getAttribute("user_id").toString());
			if(request.getParameter("musicListid") != null){
				musicListId = request.getParameter("musicListid");
			}
	//System.out.println(musicListId);
			String musicid_list = GetMusicInfo.getMusicListID(musicListId);
			String musicListName = GetMusicInfo.getMusicListName(musicListId);
			String musicListCreateDate = GetMusicInfo.getMusicListCreateDate(musicListId);
	        Map<String,Music> map = GetMusicInfo.getMusicInfo(musicid_list);		//一个歌单中歌曲信息
	        List<MusicList> musicList = GetMusicInfo.getUserList(request.getSession().getAttribute("user_id").toString());		//用户所有歌单信息
	        request.setAttribute("musiclist", musicList);
	        request.setAttribute("infomap", map);
	        request.setAttribute("listId", musicListId);
	        request.setAttribute("listName", musicListName);
	        request.setAttribute("createDate", musicListCreateDate);
			request.getRequestDispatcher("userlist.jsp").forward(request, response);
		}else{
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
