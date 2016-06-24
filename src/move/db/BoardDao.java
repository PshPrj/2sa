package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import move.dbcp.C3P0Mgr;
import move.dbcp.DBconnectionMgr;

public class BoardDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	//private C3P0Mgr pool;
	
	String sql;
	
	public BoardDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB연결객체 생성 실패 : "+err);
		}
	}
	
	public Vector BoardList(String keyField, String keyWord) throws Exception{
		sql="select * from tblBoard order by pos asc";
		//글을 pos 순서대로 정렬
		if(keyWord!=null || !keyWord.equals("")){
			//검색키워드와 검색어가 있는 경우 해당 검색 결과만 나올 수 있도록 sql문을 바꿔준다.
			sql="select * from tblBoard where "+keyField+" like '%"+keyWord+"%' order by pos asc";
		}else{
			
		}
		Vector boardlist=new Vector();
		
		try {
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto=new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setCount(rs.getInt("count"));
				dto.setIp(rs.getString("ip"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));

				boardlist.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardList 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return boardlist;
	}
	
	public void insertBoard(BoardDto board) throws Exception{
			
			try {
				con=pool.getConnection();
				
				String upSql="update tblBoard set pos=pos+1";		
				//새 글이 입력되기 전 먼저 입력된 글들의 pos값을 1씩 증가시킨다.
				stmt=con.prepareStatement(upSql);
				stmt.executeUpdate();
				
				sql="insert into tblBoard values(seq_num.nextVal-1,?,?,?,?,?,?,?,?,sysdate,?,?)";	
				stmt=con.prepareStatement(sql);
				
				stmt.setString(1, board.getName());
				stmt.setString(2, board.getEmail());
				stmt.setString(3, board.getHomepage());
				stmt.setString(4, board.getSubject());
				stmt.setString(5, board.getContent());
				stmt.setString(6, board.getPass());
				stmt.setInt(7, 0);
				stmt.setString(8, board.getIp());
				stmt.setInt(9, 0);
				stmt.setInt(10, 0);
				
				stmt.executeQuery();
				
			} catch (SQLException e) {
				System.out.println("insertBoard 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
		
		
	}
	
	public BoardDto getBoard(int num, boolean isRead) throws Exception{
		sql="select * from tblBoard where num=?";
		String sql2="update tblBoard set count=count+1 where num="+num;
		BoardDto dto=new BoardDto();
		
		try {
			con=pool.getConnection();
			
			if(isRead==true){
				//게시물을 '읽은' 경우.
				stmt=con.prepareStatement(sql2);
				stmt.executeUpdate();
			}
			
			//게시물을 읽는 것이 아니라 수정 기타의 이유로 글의 값을 알아야 하는 경우.
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, num);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setCount(rs.getInt("count"));
				dto.setIp(rs.getString("ip"));
				dto.setRegdate(rs.getDate("regdate").toString());
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	public boolean updateBoard(BoardDto board) throws Exception{
		
		sql="select pass from tblBoard where num=?";
		String pass=null;		
		
		try {
			
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, board.getNum());
			
			rs=stmt.executeQuery();
			
			while(rs.next()){
				pass=rs.getString("pass");
			}
			
			if(!pass.equals(board.getPass())){
				return false;
			}else{
				//sql="Update tblBoard set name=?, email=?, homepage=?, subject=?, content=?, pass=?, count=?, ip=?, regdate=to_date(?,'YYYY-MM-DD HH24:MI:SS'), pos=?, depth=? "
					//	+ "where num=?";	
				
				String sql2="Update tblBoard set name=?, email=?, subject=?, content=? where num=?";
				
				stmt=con.prepareStatement(sql2);
				
				stmt.setString(1, board.getName());
				stmt.setString(2, board.getEmail());
				stmt.setString(3, board.getSubject());
				stmt.setString(4, board.getContent());
				stmt.setInt(5, board.getNum());
				
				//stmt=con.prepareStatement(sql);
			
				/*
				stmt.setString(1, board.getName());
				stmt.setString(2, board.getEmail());
				stmt.setString(3, board.getHomepage());
				stmt.setString(4, board.getSubject());
				stmt.setString(5, board.getContent());
				stmt.setString(6, board.getPass());
				stmt.setInt(7, board.getCount());
				stmt.setString(8, board.getIp());
				stmt.setString(9, board.getRegdate());
				stmt.setString(10, "0");
				stmt.setString(11, "0");
				stmt.setInt(12, board.getNum());*/
				
				stmt.executeQuery();
				
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt);
		}
		return true;
		
		
	}
	
	public boolean deleteBoard(BoardDto board) throws Exception{
		sql="select pass from tblBoard where num=?";
		String pass=null;		
		
		try {
			
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, board.getNum());
			
			rs=stmt.executeQuery();
			
			while(rs.next()){
				pass=rs.getString("pass");
				System.out.println(pass);
				
			}
			
			if(!pass.equals(board.getPass())){
				return false;
			}else{
				sql = "Delete from tblBoard where num=?";
				
				stmt=con.prepareStatement(sql);
			
				stmt.setInt(1, board.getNum());
				stmt.executeQuery();
			}
			
		} catch (SQLException e) {
			System.out.println("delete 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	
	public void replyBoard(BoardDto board) throws Exception{
		sql="insert into tblBoard(num, name, email, homepage, subject, content, pass, count, ip, regdate, pos, depth)"
				+"values(seq_num.nextVal,?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			con=pool.getConnection();
			
			String upSql="update tblBoard set pos=pos+1 where pos>"+board.getPos();
			//부모 글보다 먼저 입력된 글들의 pos값을 1씩 증가시킨다.
			stmt=con.prepareStatement(upSql);
			stmt.executeUpdate();
			
			stmt=con.prepareStatement(sql);
			
			stmt.setString(1, board.getName());
			stmt.setString(2, board.getEmail());
			stmt.setString(3, board.getHomepage());
			stmt.setString(4, board.getSubject());
			stmt.setString(5, board.getContent());
			stmt.setString(6, board.getPass());
			stmt.setInt(7, board.getCount());
			stmt.setString(8, board.getIp());
			stmt.setInt(9, board.getPos()+1);
			stmt.setInt(10, board.getDepth()+1);
			
		    stmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("BoardList 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
	}
	
	public String setDepth(int depth){
		String result="";
			for(int i=0;i<depth*3;i++){
				result+="&nbsp";
			}
		return result;
	}
	
}
