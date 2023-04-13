package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import util.DBConn;

import vo.Reply;

public class ReplyDao {

	public List<Reply> list(Long bno){
	Connection conn = DBConn.getConnection(); //1번 커넥션
	
	List<Reply> list  = new ArrayList<>();
	
	try {
		String sql = "SELECT\r\n" + 
				"	RNO, TITLE, CONTENT ,TO_CHAR(REGDATE,'YY/MM/DD') REGDATE ,ID\r\n" + 
				"FROM TBL_REPLY \r\n" + 
				"WHERE RNO >0 AND BNO =?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, bno);
		ResultSet rs = pstmt.executeQuery();
		
	
		
		
		
		
	while(	rs.next()) {
		int idx =1;
		Long rno = rs.getLong(idx++);
		String title =	rs.getString(idx++);
		String content=rs.getString(idx++);
		String regDate =rs.getString(idx++);
		String id =	rs.getString(idx++);
		
		Reply reply = new Reply(rno,title,content,regDate,id,bno);
		list.add(reply);
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	return list;

}
	
	public Reply select(Long rno){

	Connection conn = DBConn.getConnection(); //1번 커넥션
	
	Reply reply  = null;
	
	try {
		String sql = "SELECT\r\n" + 
				"	RNO, TITLE, CONTENT ,TO_CHAR(REGDATE,'YY/MM/DD') REGDATE ,ID,BNO\r\n" + 
				"FROM TBL_REPLY \r\n" + 
				"WHERE RNO = ?";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1, rno);
		ResultSet rs = pstmt.executeQuery();
		
	
		
		
		
		
	while(	rs.next()) {
		int idx =1;
		rno = rs.getLong(idx++);
		String title =	rs.getString(idx++);
		String content=rs.getString(idx++);
		String regDate =rs.getString(idx++);
		String id =	rs.getString(idx++);
		Long  bno =rs.getLong(idx++);
		
		reply = new Reply(rno,title,content,regDate,id,bno);
		
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	return reply;

}
	public void delete(Long rno) {
		Connection conn= DBConn.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("DELETE TBL_REPLY WHERE RNO =?");
			
			int idx=1;
			
			pstmt.setLong(idx++, rno);
			
			
			pstmt.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(true);
				
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void insert(Reply reply) {
		Connection conn= DBConn.getConnection();
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO TBL_REPLY(RNO,TITLE,CONTENT,ID,BNO) VALUES(SEQ_REPLY.NEXTVAL,?, ?, ?, ?)");
			int idx = 1;
			
			pstmt.setString(idx++, reply.getTitle());
			pstmt.setString(idx++, reply.getContent());
			pstmt.setString(idx++, reply.getId());
			pstmt.setLong(idx++, reply.getBno());
			//select : execqteQuery
			//unsert update delete : executeUpdate
			
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	public String findIdBy(Long rno) {
		Connection conn = DBConn.getConnection();
		String id = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT ID FROM TBL_REPLY WHERE RNO = ?");
			pstmt.setLong(1, rno);
			ResultSet rs = pstmt.executeQuery();
			
			
			
			if(rs.next()) {
				id = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}
	
}
