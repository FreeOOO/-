package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dao.ConnectMysql;

public class UpLoadMusic {
	public static void upLoad(String musicName,String fileName,String singleName,String musictime){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("insert into singlemusic (musicname,filename,time,singerName) values(?,?,?,?)");
			ps.setString(1, musicName);
			ps.setString(2, fileName);
			ps.setString(3, singleName);
			ps.setString(4, musictime);
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
}
