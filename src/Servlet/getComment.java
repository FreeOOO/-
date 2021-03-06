package Servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.CommentInfo;

/**
 * Servlet implementation class getComment
 */
@WebServlet("/getComment")
public class getComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String comment = request.getParameter("comment");
		comment =  java.net.URLDecoder.decode(comment, "UTF-8");
		String listid = request.getParameter("listid");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式yyyy-MM-dd HH:mm:ss
		String time = df.format(new Date());
//System.out.println(comment + time);
		CommentInfo.addComment(listid,request.getSession().getAttribute("user_name").toString(), comment, time);
	}

}
