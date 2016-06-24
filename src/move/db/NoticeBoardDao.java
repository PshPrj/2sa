
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/8
	���� �Խ��� dao

 */

package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;


public class NoticeBoardDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	
	String sql;
	
	public NoticeBoardDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB���ᰴü ���� ���� : "+err);
		}
	}
	
	
	//���� �Խ����� ��� �Խù� �ҷ�����.
	public Vector BoardList(String keyField, String keyWord) throws Exception{//�Խù� ��ü�� �о��.
		sql="select * from notice_board order by notice_board_num desc";
		//���� num ������� ����
		if(keyWord!=null || !keyWord.equals("")){
			//�˻�Ű����� �˻�� �ִ� ��� �ش� �˻� ����� ���� �� �ֵ��� sql���� �ٲ��ش�.
			sql="select * from notice_board where "+keyField+" like '%"+keyWord+"%' order by notice_board_num desc";
		}else{
			
		}
		Vector boardlist=new Vector();
		
		try {
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				NoticeBoardDto dto=new NoticeBoardDto();
				dto.setNotice_board_num(rs.getInt("notice_board_num"));
				dto.setNotice_date(rs.getString("notice_date"));
				dto.setNotice_subject(rs.getString("notice_subject"));
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_views_cnt(rs.getInt("notice_views_cnt"));
				dto.setStaff_num(rs.getInt("staff_num"));
				
				boardlist.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("BoardList ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return boardlist;
	}
	
	
	//���� ����ϱ�.
	public void insertBoard(NoticeBoardDto board) throws Exception{
			
			try {
				con=pool.getConnection();
				
				sql="insert into notice_board (notice_date, notice_subject, notice_content, notice_views_cnt, staff_num) values(now(),?,?,?,?)";	
				stmt=con.prepareStatement(sql);

				System.out.println(board.getNotice_content()+"content");

				
				stmt.setString(1, board.getNotice_subject());
				stmt.setString(2, board.getNotice_content());
				stmt.setInt(3, 0);
				stmt.setInt(4, board.getStaff_num());
				
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insertBoard ���� : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
		
		
	}
	
	
	//�ش� ��ȣ�� ���� �ҷ�����.
	public NoticeBoardDto getBoard(int num, boolean isRead) throws Exception{
		sql="select * from notice_board where notice_board_num=?";
		String sql2="update notice_board set notice_views_cnt=notice_views_cnt+1 where notice_board_num="+num;
		NoticeBoardDto dto=new NoticeBoardDto();
		
		try {
			con=pool.getConnection();
			
			if(isRead==true){
				//�Խù��� '����' ���.
				stmt=con.prepareStatement(sql2);
				stmt.executeUpdate();
			}
			
			//�Խù��� �д� ���� �ƴ϶� ���� ��Ÿ�� ������ ���� ���� �˾ƾ� �ϴ� ���.
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, num);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setNotice_board_num(rs.getInt("notice_board_num"));
				dto.setNotice_date(rs.getString("notice_date"));
				dto.setNotice_subject(rs.getString("notice_subject"));
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_views_cnt(rs.getInt("notice_views_cnt"));
				dto.setStaff_num(rs.getInt("staff_num"));
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	
	
	//���� ��ϵ� ���� ��������.
	public int todayBoard() throws Exception{
		
		
		sql="select * from notice_board where notice_date> CURRENT_DATE();";
		int i=0;
		
		try {
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				i++;
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return i;
	}
	
	
	
	//���� �����ϱ�.
	public boolean updateBoard(NoticeBoardDto board) throws Exception{	
		
		sql="Update notice_board set notice_subject=?, notice_content=? where notice_board_num=?";
		
		try {							
				con=pool.getConnection();
				
				stmt=con.prepareStatement(sql);
				
				stmt.setString(1, board.getNotice_subject());
				stmt.setString(2, board.getNotice_content());
				stmt.setInt(3, board.getNotice_board_num());
				
				System.out.println(board.getNotice_subject());

				stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt);
		}
		return true;
		
		
	}
	
	
	
	//���� �����ϱ�.
	public boolean deleteBoard(NoticeBoardDto board) throws Exception{
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from notice_board where notice_board_num=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, board.getNotice_board_num());
			stmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("delete ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	
}
