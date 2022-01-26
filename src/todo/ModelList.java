package todo;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ModelList implements Serializable {

	public List<TodoObject> getDbData() {
		List<TodoObject> list = new ArrayList<>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select id, name from todo_list order by id desc");

			while (rs.next()) {
				TodoObject obj = new TodoObject(rs.getInt("id"), rs.getString("name"));
				list.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return Collections.emptyList();
		} catch (NamingException e) {
			e.printStackTrace();
			return Collections.emptyList();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return Collections.emptyList();
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public boolean addDBData(String name) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ps = con.prepareStatement("insert into todo_list (name) VALUES (?)");
			ps.setString(1, name);
			int num = ps.executeUpdate();
			if (num <= 0) {
				return false;
			}


		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (NamingException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public boolean updateDBData(int id, String name) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ps = con.prepareStatement("update todo_list set name = ? where id = ?");
			ps.setString(1, name);
			ps.setLong(2, id);
			int num = ps.executeUpdate();
			if (num <= 0) {
				return false;
			}


		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (NamingException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public boolean deleteDBData(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ps = con.prepareStatement("delete from todo_list where id = ?");
			ps.setLong(1, id);
			int num = ps.executeUpdate();
			if (num <= 0) {
				return false;
			}


		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} catch (NamingException e) {
			e.printStackTrace();
			return false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	/**
	 * DBとの接続を取得します。
	 * 
	 * @return DBとのConnection
	 * @throws NamingException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	Connection getConnection() throws NamingException, SQLException, ClassNotFoundException {
		final String dataSourceName = "java:comp/env/jdbc/postgresql";
		Connection con = null;
		System.out.println("コネクションプールよりDB接続を取得します。");
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup(dataSourceName);
		con = ds.getConnection();

		return con;
	}
}
