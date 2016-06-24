/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	댓글 dao

 */
package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;

public class CommentDao {
		private Connection con;
		private PreparedStatement stmt;
		private ResultSet rs;
		private DBconnectionMgr pool;
		//private C3P0Mgr pool;
		
		String sql;
		
		public CommentDao(){
			try{
				pool = DBconnectionMgr.getInstance();
			}catch(Exception err){
				System.out.println("DB연결객체 생성 실패 : "+err);
			}
		}
		
		
		//댓글 추가하기.
		public void insertComment(CommentDto dto){
			try {
				con=pool.getConnection();
				
				sql="insert into comment (member_num, comment_content, board_num, content_num, comment_date, is_secret) values(?,?,?,?,now(),?)";
				
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, dto.getMember_num());
				stmt.setString(2, dto.getComment_content());
				stmt.setInt(3, dto.getBoard_num());
				stmt.setInt(4, dto.getContent_num());
				stmt.setBoolean(5, dto.isIs_secret());
				
				stmt.executeUpdate();
				
				System.out.println(sql);
				
				
			} catch (Exception e) {
				System.out.println("insertComment에러"+e);
			}
		}
		
		
		//댓글이 어느 게시판에 추가되었는지 알기 위한 메서드.
		public String searchBoard_nic(CommentDto dto){
			String board_nic="";
			try {
				con=pool.getConnection();
				
				sql="select board_nic from board where board_num=?";
				
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, dto.getBoard_num());
				
				rs=stmt.executeQuery();
				
				while(rs.next()){
					board_nic=rs.getString(1);
				}
				
				
			} catch (Exception e) {
				System.out.println("insertComment에러"+e);
			}
			return board_nic;
		}
		
		
		//해당 게시판의 게시물에 등록된 리플들 가져오기.
		public Vector<CommentDto> commentList(CommentDto dto){
			Vector commentList=new Vector();
			try {
				con=pool.getConnection();
				
				sql="select * from comment where board_num=? and content_num=?";
				
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, dto.getBoard_num());
				stmt.setInt(2, dto.getContent_num());
				
				rs=stmt.executeQuery();
				
				while(rs.next()){
					CommentDto dto2 = new CommentDto();
					dto2.setBoard_num(rs.getInt("board_num"));
					dto2.setComment_num(rs.getInt("comment_num"));
					dto2.setComment_content(rs.getString("comment_content"));
					dto2.setMember_num(rs.getInt("member_num"));
					dto2.setComment_date(rs.getString("comment_date"));
					dto2.setIs_secret(rs.getBoolean("is_secret"));
					
					commentList.add(dto2);
					//board_nic=rs.getString(1);
				}
				
				commentList=searchMember_id(commentList);
				
				
			} catch (Exception e) {
				System.out.println("CommentList에러"+e);
			}
			
			return commentList;
		}
		
		
		
		//리플을 등록한 회원의 아이디 가져오기.
		public Vector searchMember_id(Vector commentList){
			
			String member_id=null;
			try {
				con=pool.getConnection();
				
				sql="select member_id from member where member_num=?";
				
				stmt=con.prepareStatement(sql);
				
				for(int i=0;i<commentList.size();i++){
					CommentDto dto = (CommentDto)commentList.get(i);
					
					stmt.setInt(1, dto.getMember_num());
					
					rs=stmt.executeQuery();
					
					while(rs.next()){
						dto.setMember_id(rs.getString(1));
					}
				}
				
				
			} catch (Exception e) {
				System.out.println("CommentList에러"+e);
			}
			return commentList;
		}
		
		
		
		//댓글 삭제하기.
		public void commentDelete(CommentDto dto){
			try {
				con=pool.getConnection();
				
				sql="Delete from comment where comment_num=?";
				
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, dto.getComment_num());
				
				stmt.executeUpdate();			
				
			} catch (Exception e) {
				System.out.println("CommentDelete에러"+e);
			}
		}
		
		
		
		//댓글 수정하기.
		public void commentUpdate(CommentDto dto){
			try {
				con=pool.getConnection();
				
				sql="Update comment set comment_content=? where comment_num=?";
				
				stmt=con.prepareStatement(sql);
				
				stmt.setString(1, dto.getComment_content());
				stmt.setInt(2, dto.getComment_num());
				
				stmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("commentUPdate오류"+e);
			}
		}
		
}
