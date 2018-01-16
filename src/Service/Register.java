package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Dao.ConnectMysql;

public class Register {
	public void addUser(String userName,String pwd,String email){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = ConnectMysql.connectMysql();
			ps = con.prepareStatement("insert into userinformation (userName,password,userId,phone) values (?,?,?,?)");
			ps.setString(1, userName);
			ps.setString(2, GetMD5.getMd5(pwd));
			ps.setString(3, email);
			ps.setString(4, "");
			ps.execute();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ConnectMysql.closeSta(ps);
				ConnectMysql.closeConn(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
