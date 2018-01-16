package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.Comment;
import Dao.ConnectMysql;

public class CommentInfo {
	public static void addComment(String listId,String userid,String comment,String time){
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = ConnectMysql.connectMysql();
				ps = con.prepareStatement("insert into comment (userid,musicid,content,createtime) values (?,?,?,?)");
				ps.setString(1, userid);
				ps.setString(2, listId);
				ps.setString(3, comment);
				ps.setString(4, time);
				ps.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}finally{
				try {
					ConnectMysql.closeSta(ps);
					ConnectMysql.closeRs(rs);
					ConnectMysql.closeConn(con);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}
	
	public static List<Comment> getMusicListComment(String listId){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from comment where musicId = ?");
			ps.setString(1, listId);
			rs = ps.executeQuery();
			while(rs.next()){
				Comment c = new Comment();
				c.setUserId(rs.getString("userId"));
				c.setContent(rs.getString("content"));
				c.setCreateTime(rs.getString("createTime"));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally{
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
