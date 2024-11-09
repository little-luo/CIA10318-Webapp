package com.stud.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.Driver;

public class StudJDBCDAO implements StudDAO_interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mypractice?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "louis75394";
	
	public static final String INSERT_STMT = "insert into stud(stud_loc,stud_name,capacity,hourly_rate,equipment) values(?,?,?,?,?)";
	public static final String DELETE_STMT = "delete from stud where stud_id = ?";
	public static final String UPDATE_STMT = "update stud set stud_loc = ?, stud_name = ?, capacity = ?, hourly_rate = ?, equipment = ? where stud_id = ?";
	public static final String GET_ONE_STMT = "select * from stud where stud_id = ?";
	public static final String GET_ALL_STMT = "select * from stud";
	
	@Override
	public void insert(StudVO studVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, studVO.getStudLoc());
			pstmt.setString(2, studVO.getStudName());
			pstmt.setInt(3, studVO.getCapacity());
			pstmt.setDouble(4, studVO.getHourlyRate());
			pstmt.setString(5, studVO.getEquipment());
			
			pstmt.execute();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResource(null, pstmt, con);
		}
		
	}

	@Override
	public void update(StudVO studVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			
			pstmt = con.prepareStatement(UPDATE_STMT);
			pstmt.setString(1, studVO.getStudLoc());
			pstmt.setString(2, studVO.getStudName());
			pstmt.setInt(3, studVO.getCapacity());
			pstmt.setDouble(4, studVO.getHourlyRate());
			pstmt.setString(5, studVO.getEquipment());
			pstmt.setInt(6, studVO.getStudID());
			
			pstmt.execute();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResource(null,pstmt,con);
		}
		
	}

	@Override
	public void delete(Integer studID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(DELETE_STMT);

			pstmt.setInt(1, studID);
			pstmt.execute();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResource(null,pstmt,con);
		}
		
	}

	@Override
	public StudVO findByPrimaryKey(Integer studID) { 
		StudVO studvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setInt(1, studID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				studvo = new StudVO();
				studvo.setStudID(studID);
				studvo.setStudLoc(rs.getString("STUD_LOC"));
				studvo.setStudName(rs.getString("STUD_NAME"));
				studvo.setCapacity(rs.getInt("CAPACITY"));
				studvo.setHourlyRate(rs.getDouble("HOURLY_RATE"));
				studvo.setEquipment(rs.getString("EQUIPMENT"));
			}
			
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			closeResource(rs, pstmt, con);
		}
		return studvo;
	}

	@Override
	public List<StudVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudVO studvo = null;
		List<StudVO> studList = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			studList = new ArrayList<StudVO>();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				studvo = new StudVO();
				studvo.setStudID(rs.getInt("stud_id"));
				studvo.setStudLoc(rs.getString("stud_loc"));
				studvo.setStudName(rs.getString("stud_name"));
				studvo.setCapacity(rs.getInt("capacity"));
				studvo.setHourlyRate(rs.getDouble("hourly_rate"));
				studvo.setEquipment(rs.getString("equipment"));
				studList.add(studvo);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			closeResource(rs, pstmt, con);
		}
		return studList;
	}
	
	public void closeResource(ResultSet rs,PreparedStatement pstmt,Connection con) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
