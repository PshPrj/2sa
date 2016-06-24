
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���� �Խ��� dao

 */

package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;


public class QNABoardDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	
	String sql;
	
	public QNABoardDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB���ᰴü ���� ���� : "+err);
		}
	}
	
	
	//��ü ���Ǳ� �ҷ�����.
	public Vector BoardList(String keyField, String keyWord) throws Exception{
		sql="select * from qna_board order by pos asc";
		//���� hum ������� ����
		if(keyWord!=null || !keyWord.equals("")){
			//�˻�Ű����� �˻�� �ִ� ��� �ش� �˻� ����� ���� �� �ֵ��� sql���� �ٲ��ش�.
			sql="select * from qna_board where "+keyField+" like '%"+keyWord+"%' order by pos asc";
		}else{
			
		}
		Vector boardlist=new Vector();
		
		try {
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				QNABoardDto dto=new QNABoardDto();
				dto.setQna_board_num(rs.getInt("qna_board_num"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_subject(rs.getString("qna_subject"));
				dto.setQna_content(rs.getString("qna_content"));
				dto.setMember_num(rs.getInt("member_num"));
				dto.setIs_confirm(rs.getBoolean("is_confirm"));
				dto.setQna_views_cnt(rs.getInt("qna_views_cnt"));
				dto.setIs_secret(rs.getBoolean("is_secret"));
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
				
				boardlist.add(dto);
			}
			
			boardlist=searchMember_id(boardlist);
			
		} catch (SQLException e) {
			System.out.println("QnaBoardList ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return boardlist;
	}
	
	
	//�Խù��� �ۼ��� ȸ���� ���̵� �ҷ�����.
	public Vector searchMember_id(Vector qnaList){

		try {
			con=pool.getConnection();
			
			sql="select member_id from member where member_num=?";
			
			stmt=con.prepareStatement(sql);
			
			for(int i=0;i<qnaList.size();i++){
				QNABoardDto dto = (QNABoardDto)qnaList.get(i);
				
				stmt.setInt(1, dto.getMember_num());
				
				rs=stmt.executeQuery();
				
				while(rs.next()){
					dto.setMember_id(rs.getString(1));
				}
			}
			
			
		} catch (Exception e) {
			System.out.println("QNAListgetmemberid����"+e);
		}
		return qnaList;
	}
	
	
	
	//���Ǳ� �о����.
	public QNABoardDto read(QNABoardDto board, boolean isRead){
		Vector board2 =new Vector();
		try {
			con=pool.getConnection();
			
			sql="select * from qna_board where qna_board_num=?";
			String sql2="update qna_board set qna_views_cnt=qna_views_cnt+1 where qna_board_num="+board.getQna_board_num();
			
			if(isRead==true){
				//�Խù��� '����' ���.
				stmt=con.prepareStatement(sql2);
				stmt.executeUpdate();
			}
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, board.getQna_board_num());
			rs=stmt.executeQuery();
			
			while(rs.next()){
				board.setQna_board_num(rs.getInt("qna_board_num"));
				board.setQna_date(rs.getString("qna_date"));
				board.setQna_subject(rs.getString("qna_subject"));
				board.setQna_content(rs.getString("qna_content"));
				board.setMember_num(rs.getInt("member_num"));
				board.setQna_views_cnt(rs.getInt("qna_views_cnt"));
				board.setIs_secret(rs.getBoolean("is_secret"));
				board.setPos(rs.getInt("pos"));
				board.setDepth(rs.getInt("depth"));
			}
			
			board2.add(board);
			board2=searchMember_id(board2);
			
		} catch (Exception e) {
			System.out.println("QNAREAD ����"+e);
		}
		
		return (QNABoardDto)board2.get(0);
	}
	
	
	
	//���� ����ϱ�.
	public void insertBoard(QNABoardDto board) throws Exception{
			
			try {
				con=pool.getConnection();
				
				String upSql="update qna_board set pos=pos+1";		
				//�� ���� �ԷµǱ� �� ���� �Էµ� �۵��� pos���� 1�� ������Ų��.
				stmt=con.prepareStatement(upSql);
				stmt.executeUpdate();
				
				sql="insert into qna_board (qna_date, qna_subject, qna_content,member_num, is_confirm, qna_views_cnt, is_secret, pos, depth) values(now(),?,?,?,?,?,?,?,?)";	
				stmt=con.prepareStatement(sql);
				
				stmt.setString(1, board.getQna_subject());
				stmt.setString(2, board.getQna_content());
				stmt.setInt(3, board.getMember_num());
				stmt.setBoolean(4, board.isIs_confirm());
				stmt.setInt(5, board.getQna_views_cnt());
				stmt.setBoolean(6, false);
				stmt.setInt(7, 0);
				stmt.setInt(8, 0);
				
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insertBoard ���� : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
		
		
	}
	
	
	
	//�ش� ��ȣ�� ���Ǳ� ��������.
	public QNABoardDto getBoard(int num, boolean isRead) throws Exception{
		sql="select * from qna_board where qna_board_num=?";
		String sql2="update qna_board set qna_views_cnt=qna_views_cnt+1 where qna_board_num="+num;
		QNABoardDto dto=new QNABoardDto();
		
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
				dto.setQna_board_num(rs.getInt("qna_board_num"));
				dto.setQna_date(rs.getString("qna_date"));
				dto.setQna_subject(rs.getString("qna_subject"));
				dto.setQna_content(rs.getString("qna_content"));
				dto.setMember_num(rs.getInt("member_num"));
				dto.setIs_confirm(rs.getBoolean("is_confirm"));
				dto.setQna_views_cnt(rs.getInt("qna_views_cnt"));
				dto.setIs_secret(rs.getBoolean("is_secret"));
				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));
			}
			
		} catch (SQLException e) {
			System.out.println("qnaUpdateBoard ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	
	
	//���Ǳ� �����ϱ�.
	public void updateBoard(QNABoardDto board) throws Exception{	
		
		try {						
				sql="Update qna_board set qna_subject=?, qna_content=? where qna_board_num=?";
				
				con=pool.getConnection();
				stmt=con.prepareStatement(sql);
				
				stmt.setString(1, board.getQna_subject());
				stmt.setString(2, board.getQna_content());
				stmt.setInt(3, board.getQna_board_num());
				
				System.out.println(board.getQna_content()+"dao��");

				stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("qnaUpdateBoard ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt);
		}		
		
	}
	
	
	
	//���Ǳ� �����ϱ�.
	public boolean deleteBoard(QNABoardDto board) throws Exception{
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from qna_board where qna_board_num=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, board.getQna_board_num());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	
	
	
	//�亯�� �ޱ�.
	public void replyBoard(QNABoardDto board) throws Exception{
		
		try {
			con=pool.getConnection();
			
			String upSql="update qna_board set is_confirm=true where qna_board_num="+board.getQna_board_num();
			System.out.println(board.getQna_board_num()+"qnaboardnum");
			stmt=con.prepareStatement(upSql);
			stmt.executeUpdate();
			
			int parentPos = getPos(board);
			upSql="update qna_board set pos=pos+1 where pos>"+parentPos;
			System.out.println("�θ�pos��"+parentPos);
			System.out.println("�θ�pos��");
			//�θ� �ۺ��� ���� �Էµ� �۵��� pos���� 1�� ������Ų��.
			stmt=con.prepareStatement(upSql);
			stmt.executeUpdate();
			
			sql="insert into qna_Board(qna_date, qna_subject, qna_content, member_num, is_confirm, qna_views_cnt, is_secret, pos, depth)"
					+"values(now(), ?, ?, ?, ?, ?, ?, ?, ?)";
			
			
			
			stmt=con.prepareStatement(sql);			
			stmt.setString(1, board.getQna_subject());
			System.out.println("test");
			stmt.setString(2, board.getQna_content());
			stmt.setInt(3, board.getMember_num());
			stmt.setBoolean(4, true);
			stmt.setInt(5, 0);
			stmt.setBoolean(6, board.isIs_secret());
			stmt.setInt(7, parentPos+1);
			stmt.setInt(8, board.getDepth()+1);
			
		    stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("qnaReply ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
	}
	
	
	//���� ��ϵ� ���Ǽ� ��������.
		public int todayBoard() throws Exception{
			
			
			sql="select * from qna_board where qna_date> CURRENT_DATE();";
			int i=0;
			
			try {
				con=pool.getConnection();
				stmt=con.prepareStatement(sql);
				rs=stmt.executeQuery();
				
				while(rs.next()){
					i++;
				}
				
			} catch (SQLException e) {
				System.out.println("todaypage ���� : "+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			
			return i;
		}
		
	
	//depth �� �ֱ�.
	public String setDepth(int depth){
		String result="";
			for(int i=0;i<depth*3;i++){
				result+="&nbsp";
			}
		return result;
	}
	
	
	
	//�θ��� pos�� �޾ƿ���.
	public int getPos(QNABoardDto dto){
		int pos = 0;
		try {
			con=pool.getConnection();
			
			sql="select pos from qna_board where qna_board_num="+dto.getQna_board_num();
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				pos=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("�θ�pos�� ���ϱ� ����"+e);
		}
		return pos;
	}
	
}
