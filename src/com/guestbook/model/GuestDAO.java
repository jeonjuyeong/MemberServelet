package com.guestbook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.member.model.MemberDTO;

public class GuestDAO {
	private static GuestDAO instance = new GuestDAO();
	ArrayList<GuestDTO> arr ;
	public static GuestDAO getInstance(){
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/member");
		return ds.getConnection();
	}

	 String url,id,pwd;
	 
	public GuestDAO() {
		try {
		         Class.forName("oracle.jdbc.driver.OracleDriver");
		         url ="jdbc:oracle:thin:@localhost:1521:xe";
		         id = "HR";
		         pwd = "TIGER";
		      } 
		      catch (ClassNotFoundException e) {
		         e.printStackTrace();
		      }
		}
	public void GuestInsert(GuestDTO g) {
		Connection con= null;
		PreparedStatement ps =  null;
			try {
				con = getConnection();
				String sql = "Insert into testbook values (testbook_seq.nextval,?,?,?,SYSDATE,?)";
				ps = con.prepareStatement(sql);
				ps.setString(1,g.getName());
				ps.setString(2, g.getContent());
				ps.setString(3, g.getGrade());
				ps.setString(4, g.getIpaddr());
				
			
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeCon(con,ps);
			}
			
				
	}
	//리스트
	public ArrayList<GuestDTO> guestList(int startRow,int endRow) {

        Connection con= null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<GuestDTO> arr = new ArrayList<>();
        String sql="";
        try {
          con = getConnection();
          sql = "select * from(select rownum rn,aa.* from(select * from testbook order by num desc)aa)"
                + "where rn >= ? and rn <= ? ";
          ps = con.prepareStatement(sql);
          ps.setInt(1, startRow);
          ps.setInt(2, endRow);        
        
          rs = ps.executeQuery();
          while(rs.next()) {
            GuestDTO guest = new GuestDTO();
            guest.setNum(rs.getInt("num"));
            guest.setName(rs.getString("name"));
            guest.setContent(rs.getString("content"));
            guest.setGrade(rs.getString("grade"));
            guest.setCreated(rs.getString("created")); 
            guest.setIpaddr(rs.getString("ipaddr")); 
            arr.add(guest);
          }
       } catch (Exception e) {
         e.printStackTrace();
       }finally {
          closeCon(con,ps,rs);
       }
       return arr;
     }
	//검색
	public ArrayList<GuestDTO> guestlist(String field, String word , int startRow, int endRow) {
 
        Connection con= null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<GuestDTO> arr = new ArrayList<>();
        String sql="";
        try {
          con = getConnection();
          sql = "select * from(select rownum rn,aa.* from(select * from testbook  where "+field+" like '%"+word+"%' order by num desc )aa)"
                + "where rn >= ? and rn <= ? ";
       
          ps = con.prepareStatement(sql);
          ps.setInt(1, startRow);
          ps.setInt(2, endRow);
      
          rs = ps.executeQuery();
          while(rs.next()) {
            GuestDTO guest = new GuestDTO();
            guest.setNum(rs.getInt("num"));
            guest.setName(rs.getString("name"));
            guest.setContent(rs.getString("content"));
            guest.setGrade(rs.getString("grade"));
            guest.setCreated(rs.getString("created")); 
            guest.setIpaddr(rs.getString("ipaddr")); 
            arr.add(guest);
          }
       } catch (Exception e) {
         e.printStackTrace();
       }finally {
          closeCon(con,ps,rs);
       }
       return arr;
     }
	public GuestDTO guestView(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs =null;
		GuestDTO g = new GuestDTO();
		try {
			con = getConnection();
			st = con.createStatement();
			String sql="";
			sql = "select * from testbook where num="+num;
			rs = st.executeQuery(sql);
			if (rs.next()) {
				g.setNum(rs.getInt("num"));
				g.setName(rs.getString("name"));
				g.setContent(rs.getString("content"));
				g.setGrade(rs.getString("grade"));
				g.setCreated(rs.getString("created"));
				g.setIpaddr(rs.getString("ipaddr"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeCon(con, st,rs);
		}
		return g;
	}
	//삭제
	public void Delete(String name) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = getConnection();
			String sql = "Delete from testbook where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeCon(con,ps);
		}
	}
	public int guestCount() {
		Connection con=null;
		Statement st= null;
		ResultSet rs = null;
		int count=0;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql="select count(*) from testbook";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count =rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	//검색 카운트
	public int guestCount(String field,String word) {
		Connection con=null;
		Statement st= null;
		ResultSet rs = null;
		int count=0;
		try {
			con = getConnection();
			st = con.createStatement();
			String sql="select count(*) from testbook where "+field+" like '%"+word+"%'";
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count =rs.getInt("count(*)");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
private void closeCon(Connection con, PreparedStatement ps){
		
		try {
			if(con!=null)con.close();
			if(ps!=null)ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}
private void closeCon(Connection con,Statement st, ResultSet rs){
	
	try {
		if(con!=null)con.close();
		if(st!=null)st.close();
		if(rs!=null)rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

	
}
