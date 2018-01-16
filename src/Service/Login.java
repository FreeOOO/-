package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dao.ConnectMysql;

public class Login {
	public static boolean isExist(String userid){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from userinformation where userId = ?");
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
		return false;
	}
	
	public static boolean isLegal(String userid,String passwd){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from userinformation where userId = ? and password = ?");
			ps.setString(1, userid);
			ps.setString(2, passwd);
			rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
		return false;
	}
	
	public static String getUserId(String userId){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from userinformation where userId = ?");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getString("id");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
		return null;
	}
	
	public static String getUserName(String userId){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("select * from userinformation where userId = ?");
			ps.setString(1, userId);
			rs = ps.executeQuery();
			if(rs.next()){
				return rs.getString("username");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
		return null;
	}
}
