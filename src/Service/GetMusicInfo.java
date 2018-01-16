package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Dao.ConnectMysql;
import Dao.Music;
import Dao.MusicList;

public class GetMusicInfo {
	/*
	 * public static ResultSet getMusicListResultSet(String id){ Connection con
	 * = null; PreparedStatement ps = null; ResultSet rs = null; try { con =
	 * ConnectMysql.connectMysql(); ps =
	 * con.prepareStatement("select * from musiclist where listid = ?");
	 * ps.setString(1, id); rs = ps.executeQuery(); return rs; } catch
	 * (ClassNotFoundException e) { e.printStackTrace(); } catch (SQLException
	 * e) { e.printStackTrace(); }finally{ try { ConnectMysql.closeSta(ps);
	 * ConnectMysql.closeConn(con); } catch (SQLException e) {
	 * e.printStackTrace(); } } return null; }
	 */

	public static String getUserFiresList(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where creater = ?");
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("listid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String getMusicListID(String id) { // 获取歌单中歌曲ID字符串
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where listid = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("musicid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String getMusicListName(String id) { // 获取歌单中名
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where listid = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("listname");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String getMusicListCreateDate(String id) { // 获取歌单创建时间
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where listid = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString("createdate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public static Map<String, Music> getMusicInfo(String id) { // 获取歌曲信息
		Map<String, Music> map = new HashMap<String, Music>();
		String[] temp = id.split("&");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = null;
			for (int i = 0; i < temp.length; i++) {
				Music m = new Music();
				ps = con.prepareStatement("select * from singlemusic where musicid = ?");
				ps.setString(1, temp[i]);
				rs = ps.executeQuery();
				if (rs.next()) {
					m.setName(rs.getString("musicname"));
					m.setPath("audios/" + rs.getString("filename"));
					m.setTime(rs.getString("time"));
					m.setId(rs.getString("musicid"));
					m.setSingerName(rs.getString("singername"));
					m.setAlbum(rs.getString("album"));
					map.put(rs.getString("musicname"), m);
					// System.out.println(temp[i] + "*///"+
					// rs.getString("musicname") + "*///" + "audios/" +
					// rs.getString("filename") + "*///" +
					// rs.getString("time"));
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/*
		 * for (Entry<String, Music> entry : map.entrySet()) {
		 * System.out.println("key= " + entry.getKey() + "  and  value= " +
		 * entry.getValue()); }
		 */
		return map;
	}

	public static List<MusicList> getUserList(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MusicList> list = new ArrayList<MusicList>();
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where creater = ?");
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicList ml = new MusicList();
				ml.setListId(rs.getString("listId"));
				ml.setListName(rs.getString("listName"));
				list.add(ml);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
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

	public static void addMuisc(String musicid, String listid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from musiclist where listid = ?");
			ps.setString(1, listid);
			rs = ps.executeQuery();
			if (rs.next()) {
				String music_id = rs.getString("musicId");
				if (music_id.equals("0")) {
					music_id = musicid;
				} else {
					music_id = music_id + "&" + musicid;
				}
				ps = con.prepareStatement("update musiclist set musicid = ? where listid = ?");
				ps.setString(1, music_id);
				ps.setString(2, listid);
				ps.execute();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void addMusicList(String listName, String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("insert into musiclist (listname,creater) values (?,?)");
			ps.setString(1, listName);
			ps.setString(2, userid);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static Map<String, Music> searchMusic(String temp) { // 获取歌曲信息
		Map<String, Music> map = new HashMap<String, Music>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		temp = "%" + temp + "%";
		try {
			con = ConnectMysql.connectMysql();
			ps = null;
			ps = con.prepareStatement("select * from singlemusic where musicName like ? or singerName like ?");
			ps.setString(1, temp);
			ps.setString(2, temp);
			rs = ps.executeQuery();
			while (rs.next()) {
				Music m = new Music();
				m.setName(rs.getString("musicname"));
				m.setPath("audios/" + rs.getString("filename"));
				m.setTime(rs.getString("time"));
				m.setId(rs.getString("musicid"));
				m.setSingerName(rs.getString("singername"));
				m.setAlbum(rs.getString("album"));
				map.put(rs.getString("musicname"), m);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeRs(rs);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
}
