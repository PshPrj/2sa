
/*

 	담당 : 박승현
	최종 수정 일자 : 6/19
	견적 dao
 */
package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import move.dbcp.DBconnectionMgr;


public class DrawingDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	
	String sql;
	
	public DrawingDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB연결객체 생성 실패 : "+err);
		}
	}
	

	
	public void insertDrawing(DrawingDto drawing) throws Exception{
		/*
		 * //저장 날자를 위한 세팅
		 */
		java.util.Date dt = new java.util.Date(); 	

		java.text.SimpleDateFormat sdf = 
		     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String currentTime = sdf.format(dt);
		
		
		/*
		 *  디비 저장
		 */
			try {
				con=pool.getConnection();
				
				sql="insert into template (member_num,img_name,regi_date_draw) values(?,?,?)";
				
				
				
				
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, drawing.getMember_num());
				stmt.setString(2, drawing.getImg_name());
				stmt.setString(3, currentTime);
				
				
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insertDrawing 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
		
		
	}
	

	/*
	db삭제
	*/
	public boolean deleteDrawing(DrawingDto drawing) throws Exception{
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from template where member_num=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, drawing.getMember_num());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	
	
	public boolean deleteDrawing2(DrawingDto drawing) throws Exception{
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from template where img_name=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setString(1, drawing.getImg_name());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	

	

	
}
