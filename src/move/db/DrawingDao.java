
/*

 	��� : �ڽ���
	���� ���� ���� : 6/19
	���� dao
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
			System.out.println("DB���ᰴü ���� ���� : "+err);
		}
	}
	

	
	public void insertDrawing(DrawingDto drawing) throws Exception{
		/*
		 * //���� ���ڸ� ���� ����
		 */
		java.util.Date dt = new java.util.Date(); 	

		java.text.SimpleDateFormat sdf = 
		     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String currentTime = sdf.format(dt);
		
		
		/*
		 *  ��� ����
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
				System.out.println("insertDrawing ���� : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
		
		
	}
	

	/*
	db����
	*/
	public boolean deleteDrawing(DrawingDto drawing) throws Exception{
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from template where member_num=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, drawing.getMember_num());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete ���� : "+e);
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
			System.out.println("delete ���� : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return true;
		
	}
	

	

	
}
