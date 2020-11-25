package Shoemuf;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	private static MemberDAO instance =new MemberDAO();
	     
	public static MemberDAO getInstance(){
		return instance;
	}
	private MemberDAO() {
		
	}
	
	private Connection getConnection() throws Exception{
        Context initCtx= new InitialContext();
        Context envCtx=(Context)initCtx.lookup("java:/comp/env");
        DataSource ds=(DataSource)envCtx.lookup("jdbc/oracle");
         
        return ds.getConnection();
    }

	//회원 아이디 , 비밀번호 체크
    public int userCheck(String id, String pwd)throws Exception{
         
        Connection conn= null;
        PreparedStatement pstmt = null;
        ResultSet rs =null;
        String sql="";
        String dbpasswd="";
        int x = -1;
         
        try{
            conn =getConnection();
            sql ="select pwd from member where id = ?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
             
            if(rs.next()){
                dbpasswd =rs.getString("pwd");
                if(dbpasswd.equals(pwd))
                    x=1; //인증성공
                else
                    x=0; //비밀번호 틀림
            }else
                x=-1; //해당 아이디 없음
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(rs,pstmt,conn);
        }
        return x;
    }
	
  //ID 중복 체크
    public int confirmId(String id)throws Exception{
        Connection conn =null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="";
        int x=-1;
        try{
            conn=getConnection();
            sql="select * from MEMBER where id= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();   
             
            if(rs.next())
                x=1; //해당아이디 있음
            else
                x=-1;//해당아이디 없음
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            execClose(rs,pstmt,conn);
        }       
        return x;
    }


    
    //회원정보
	public MemberBean listMembers(String id) throws Exception {
		Connection conn =null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member=null;
        String sql="";
        try{
            conn=getConnection();
            sql="select * from MEMBER where id= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();
             
            if(rs.next()){
                member=new MemberBean();
                member.setId(rs.getString("id"));
                member.setPwd(rs.getString("pwd"));
                member.setName(rs.getString("name"));
                member.setAddr(rs.getString("addr"));
                member.setMnumber(rs.getString("m_number"));
                member.setEmail(rs.getString("email"));
                member.setBirth(rs.getString("birth"));
               
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            execClose(rs,pstmt,conn);
        }
        return member;

	}
	


	
	
	
	//회원가입
    public void insertMember(MemberBean member)throws Exception{
        Connection conn= null;
        PreparedStatement pstmt = null;
        String sql="";
        int cnt = 0;
         
        try{
        	
            conn= getConnection();
            sql ="insert into MEMBER values(?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(++cnt, member.getId());
            pstmt.setString(++cnt, member.getPwd());
            pstmt.setString(++cnt, member.getName());
            pstmt.setString(++cnt, member.getAddr());
            pstmt.setString(++cnt, member.getMnumber());
            pstmt.setString(++cnt, member.getEmail());
            pstmt.setString(++cnt, member.getBirth());
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }

	
	
	//회원정보 수정	
	public void updateMember(MemberBean member)throws Exception{
        Connection conn=null;
        PreparedStatement pstmt =null;
        String sql = null;
        int cnt =0;
        try{
            conn =getConnection();
            sql = "update member set pwd=?, name=?, addr=?, m_number=?, email=?, birth=? where id=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(++cnt, member.getPwd());
            pstmt.setString(++cnt, member.getName());
            pstmt.setString(++cnt, member.getAddr());
            pstmt.setString(++cnt, member.getMnumber());
            pstmt.setString(++cnt, member.getEmail());
            pstmt.setString(++cnt, member.getBirth());
            pstmt.setString(++cnt, member.getId());
             
            pstmt.executeUpdate();
             
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }  
	//회원탈퇴 , 회원정보 삭제
    public void deleteMember(String id)throws Exception{
        Connection conn=null;
        PreparedStatement pstmt =null;
        String sql = null;
        try{
            conn =getConnection();
            sql = "delete from MEMBER where id=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }


	

		
	
	
	
	public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
        //자원정리
        if(rs !=null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
        //커넥션 풀로 반납
        if(conn !=null) try{conn.close();}catch(SQLException sqle){}
    }


		
	
}