package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dao.ConnectMysql;
import Dao.MusicList;

public class HomeMusicInfo {
	public static List<MusicList> getMusicList(String id){			//获取歌单中歌曲ID字符串
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MusicList> list = new ArrayList<MusicList>();
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist order by createdate desc");
			rs = ps.executeQuery();
			while(rs.next()){
				MusicList m = new MusicList();
				m.setListName(rs.getString("listName"));
				m.setIntroduce(rs.getString("introduce"));
				m.setCreateDate(rs.getString("createDate"));
				m.setListId(rs.getString("listId"));
				m.setCreater(rs.getString("creater"));
				list.add(m);
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
