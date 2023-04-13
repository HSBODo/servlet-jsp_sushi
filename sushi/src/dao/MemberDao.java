package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Member;

public class MemberDao {
	public List<Member>  getMembers(){
		//1. Connection 취득
		//2. 문장(Statement)생성
		//3. Select >> 결과 집합	(ResultSet)
		// >rs 순회
		
		
		Connection conn = DBConn.getConnection(); //1번 커넥션
		
		List<Member> list  = new ArrayList<Member>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ID,PWD,EMAIL,NAME  FROM TBL_MEMBER");
			
		while(	rs.next()) {
			String id =	rs.getString("id");
			String pwd =rs.getString("pwd");
			String email =	rs.getString("email");
			String name =	rs.getString("name");
			
			Member member = new Member(id,pwd,email,name);
			list.add(member);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean login(String id, String pwd) {
		Connection conn= DBConn.getConnection();
		boolean succes = false;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER "+"WHERE ID = '"+id+"'AND PWD = '"+pwd+"'");
			succes = rs.next();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return succes;
	}
	
	
	
	
	public void join(Member member) {
		Connection conn= DBConn.getConnection();
	
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO TBL_MEMBER VALUES(?, ?, ?, ?)");
			int idx = 1;
			
			pstmt.setString(idx++, member.getId());
			pstmt.setString(idx++, member.getPwd());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getName());
			//select : execqteQuery
			//unsert update delete : executeUpdate
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	public void modify(Member member) {
		Connection conn= DBConn.getConnection();
	
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("UPDATE TBL_MEMBER SET PWD=?, EMAIL=?, NAME=? WHERE ID = ?");
			int idx = 1;
			
			pstmt.setString(idx++, member.getPwd());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getName());
			pstmt.setString(idx++, member.getId());
			//select : execqteQuery
			//unsert update delete : executeUpdate
			
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	//select : execqteQuery
	//unsert update delete : executeUpdate
	public void delete(Member member) {
		Connection conn= DBConn.getConnection();
	
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("UPDATE TBL_BOARD SET ID='탈퇴회원' WHERE ID = ?");
			int idx = 1;
			pstmt.setString(idx, member.getId());
			pstmt.executeUpdate();
			conn.commit();
			
			pstmt = conn.prepareStatement("UPDATE TBL_REPLY SET ID='탈퇴회원' WHERE ID = ?");
			pstmt.setString(idx, member.getId());
			pstmt.executeUpdate();
			conn.commit();
			
			pstmt = conn.prepareStatement("UPDATE TBL_REVIEW SET ID='탈퇴회원' WHERE ID = ?");
			pstmt.setString(idx, member.getId());
			pstmt.executeUpdate();
			conn.commit();
			
			pstmt = conn.prepareStatement("DELETE TBL_MEMBER  WHERE ID = ?");
			pstmt.setString(idx, member.getId());
			
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	

	
	
	public Member findBy(String id) {
		Connection conn= DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE ID = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				member = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++)
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return member;
		
	}
	public Member emfindBy(String email) {
		Connection conn= DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE email = ?");
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				member = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++)
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return member;
		
	}
	public Member pwdfindBy(String pwd) {
		Connection conn= DBConn.getConnection();
		Member member = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ID, PWD, EMAIL, NAME FROM TBL_MEMBER WHERE pwd = ?");
			pstmt.setString(1, pwd);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				member = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++)
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return member;
		
	}
}
