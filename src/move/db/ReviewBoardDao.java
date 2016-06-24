
/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	문의 게시판 dao

 */

package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;

public class ReviewBoardDao {
		private Connection con;
		private PreparedStatement stmt;
		private ResultSet rs;
		private DBconnectionMgr pool;
		//private C3P0Mgr pool;
		
		String sql;
		
		public ReviewBoardDao(){
			try{
				pool = DBconnectionMgr.getInstance();
			}catch(Exception err){
				System.out.println("DB연결객체 생성 실패 : "+err);
			}
		}
		
		
		//문의글 불러오기.
		public Vector BoardList(String keyField, String keyWord) throws Exception{
			sql="select * from review_board order by review_board_num desc";
			//글을 hum 순서대로 정렬
			if(keyWord!=null || !keyWord.equals("")){
				//검색키워드와 검색어가 있는 경우 해당 검색 결과만 나올 수 있도록 sql문을 바꿔준다.
				sql="select * from review_board where "+keyField+" like '%"+keyWord+"%' order by review_board_num desc";
			}else{
				
			}
			Vector boardlist=new Vector();
			
			try {
				con=pool.getConnection();
				stmt=con.prepareStatement(sql);
				rs=stmt.executeQuery();
				
				while(rs.next()){
		
					ReviewBoardDto dto = new ReviewBoardDto();
					dto.setReview_board_num(rs.getInt("review_board_num"));
					dto.setReview_subject(rs.getString("review_subject"));
					dto.setReview_content(rs.getString("review_content"));
					dto.setStar(rs.getInt("star"));
					dto.setReview_date(rs.getString("review_date"));
					dto.setReview_views_cnt(rs.getInt("review_views_cnt"));
					dto.setMember_num(rs.getInt("member_num"));
					
					boardlist.add(dto);
				}
				
				boardlist=searchMember_id(boardlist);
				
			} catch (SQLException e) {
				System.out.println("ReviewBoardList 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			
			return boardlist;
		}
		
		
		//후기글 삭제.
		public boolean deleteBoard(ReviewBoardDto board) throws Exception{
			
			try {
				
				con=pool.getConnection();
				
				sql = "Delete from review_board where review_board_num=?";
					
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, board.getReview_board_num());
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("delete 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			return true;
			
		}
		
		
		//문의글을 작성한 회원의 id검색해오기.
		public Vector searchMember_id(Vector reviewList){

			try {
				con=pool.getConnection();
				
				sql="select member_id from member where member_num=?";
				
				stmt=con.prepareStatement(sql);
				
				for(int i=0;i<reviewList.size();i++){
					ReviewBoardDto dto = (ReviewBoardDto)reviewList.get(i);
					
					stmt.setInt(1, dto.getMember_num());
					
					rs=stmt.executeQuery();
					
					while(rs.next()){
						dto.setMember_id(rs.getString("member_id"));
					}
					
				}
				
				
			} catch (Exception e) {
				System.out.println("ReviewListgetmemberid에러"+e);
			}
			return reviewList;
		}
		
		
		//문의글 수정하기.
		public void updateBoard(ReviewBoardDto dto){
			try {
				con=pool.getConnection();
				
				sql="update review_board set review_subject=?, review_content=? where review_board_num=?";
				stmt=con.prepareStatement(sql);
				stmt.setString(1, dto.getReview_subject());
				stmt.setString(2, dto.getReview_content());
				stmt.setInt(3, dto.getReview_board_num());
				
				stmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("리뷰업데이트오류"+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
		}
		
		
		
		//해당 번호의 문의글 가져오기.
		public ReviewBoardDto getBoard(ReviewBoardDto dto, boolean isRead){
			Vector board =new Vector();
			try {
				con=pool.getConnection();
				
				sql="select * from review_board where review_board_num=?";
				String sql2="update review_board set review_views_cnt=review_views_cnt+1 where review_board_num="+dto.getReview_board_num();
				
				if(isRead==true){
					//게시물을 '읽은' 경우.
					stmt=con.prepareStatement(sql2);
					stmt.executeUpdate();
				}
				
				stmt=con.prepareStatement(sql);
				stmt.setInt(1, dto.getReview_board_num());
				rs=stmt.executeQuery();
				
				while(rs.next()){
					dto.setReview_board_num(rs.getInt("review_board_num"));
					dto.setReview_subject(rs.getString("review_subject"));
					dto.setReview_content(rs.getString("review_content"));
					dto.setStar(rs.getInt("star"));
					dto.setReview_date(rs.getString("review_date"));
					dto.setReview_views_cnt(rs.getInt("review_views_cnt"));
					dto.setMember_num(rs.getInt("member_num"));
					
				}
				
				board.add(dto);
				board=searchMember_id(board);
				
			} catch (Exception e) {
				System.out.println("QNAREAD 오류"+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			
			return (ReviewBoardDto)board.get(0);
		}
		
		
		
		//문의글 등록하기.
		public void insertBoard(ReviewBoardDto dto) throws Exception{
				
				try {
					con=pool.getConnection();
										
					sql="insert into review_board (review_subject, review_content, star, review_date, review_views_cnt, member_num)"
							+ " values(?, ?, ?, now(), ?, ?)";	
					stmt=con.prepareStatement(sql);
					
					stmt.setString(1, dto.getReview_subject());
					stmt.setString(2, dto.getReview_content());
					stmt.setFloat(3, dto.getStar());
					stmt.setInt(4, 0);
					stmt.setInt(5, dto.getMember_num());
					
					stmt.executeUpdate();
					
				} catch (SQLException e) {
					System.out.println("qnainsertBoard 오류 : "+e);
				}finally{
					pool.freeConnection(con, stmt);
				}
			
			
		}
		
		//오늘 등록된 공지 가져오기.
		public int todayBoard() throws Exception{
			
			
			sql="select * from review_board where review_date> CURRENT_DATE();";
			int i=0;
			
			try {
				con=pool.getConnection();
				stmt=con.prepareStatement(sql);
				rs=stmt.executeQuery();
				
				while(rs.next()){
					i++;
				}
				
			} catch (SQLException e) {
				System.out.println("todayreview 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			
			return i;
		}
		
		
}
