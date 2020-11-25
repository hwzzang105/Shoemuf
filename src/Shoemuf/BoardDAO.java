package Shoemuf;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource dataFactory;
    
	private static BoardDAO instance =new BoardDAO();
    
	public static BoardDAO getInstance(){
		return instance;
	}
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
 	}

	public List<BoardBean> qnaList() {
		List<BoardBean> list = new ArrayList<BoardBean>();
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from qna ";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writeDate = rs.getString("writeDate");
				BoardBean mb = new BoardBean();
				mb.setId(id);
				mb.setTitle(title);
				mb.setContent(content);
				mb.setWriteDate(writeDate);
				list.add(mb);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public void addQna(BoardBean qnaBean) {
		try {
			conn = dataFactory.getConnection();
			String id = qnaBean.getId();
			String title = qnaBean.getTitle();
			String content = qnaBean.getContent();
			String writeDate = qnaBean.getWriteDate();
			String query = "insert into qna";
			query += " (id,title,content,writeDate)";
			query += " values(?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, writeDate);
			pstmt.executeUpdate();
			System.out.println("저장완료");
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void delQna(BoardBean qnaBean) {
		try {
			conn = dataFactory.getConnection();
			String id = qnaBean.getId();
			String content = qnaBean.getContent();
			String query = "delete from qna" + " where id=? and content=?";
			System.out.println("prepareStatememt:" + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delQnaAll(BoardBean BoardBean) {
		try {
			conn = dataFactory.getConnection();
			String query = "delete from qna";
			System.out.println("prepareStatememt:" + query);
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardBean qnaInfo(String id, String content) {
		BoardBean qna = null;
		try {
			conn = dataFactory.getConnection();
			String query = "select * from qna where id=? and content=?";
			System.out.println(query+"가 실행됨.");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				qna = new BoardBean();
				qna.setId(id);
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setWriteDate(rs.getString("writeDate"));
			}
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return qna;
	
	}
	
	public void updateQna(BoardBean qnaBean) {
		
		try {
			conn = dataFactory.getConnection();
			String id = qnaBean.getId();
			String title = qnaBean.getTitle();
			String content = qnaBean.getContent();
			String writeDate = qnaBean.getWriteDate();
			String query = "update qna set";
			query += " content=?, writeDate=? where id=? and title=?";
			System.out.println(query+"가 실행됨.");
			
			pstmt = conn.prepareStatement(query);
			conn.setAutoCommit(false);
			
			pstmt.setString(1, content);
			pstmt.setString(2, writeDate);
			pstmt.setString(3, id);
			pstmt.setString(4, title);
			pstmt.executeUpdate();
			conn.commit();
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
