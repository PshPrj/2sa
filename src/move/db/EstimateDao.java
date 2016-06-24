
/*

 	담당 : 정효진
	최종 수정 일자 : 6/20
	견적 dao

 */

package move.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;

public class EstimateDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	//private C3P0Mgr pool;
	
	String sql;
	String n_lat, n_lng;
	String l_lat, l_lng;
	
	public EstimateDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB연결객체 생성 실패 : "+err);
		}
	}
	
	
	
	//해당 견적과 함꼐 저장한 모든 사진 가져오기.
	public Vector<PictureDto> searchPicture(int estimate_board_num){
		Vector picture_dto = new Vector();
		try {
			con=pool.getConnection();
			sql="select * from picture where estimate_board_num=?";
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, estimate_board_num);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				PictureDto dto = new PictureDto();
				
				dto.setPicture_num(rs.getInt("picture_num"));
				System.out.print(dto.getPicture_num());
				dto.setMember_num(rs.getInt("member_num"));
				dto.setImg(rs.getString("img"));
				dto.setEstimate_board_num(estimate_board_num);
				
				picture_dto.add(dto);
				
			}
			
			
			
		} catch (Exception e) {
			System.out.println("searchPicture오류"+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		return picture_dto;
	}
	
	
	
	//사진 삭제하기.
	public void deletePicture(int picture_num){
		try {
			con=pool.getConnection();
			sql="Delete from picture where picture_num=?";
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, picture_num);
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("pictureDelete오류"+e);
		}finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	
	
	//견적 등록하기.
	public int insertBoard(EstimateDto board) throws Exception{
		int estimate_board_num=0;
			try {				
				con=pool.getConnection();
				
				sql="insert into estimate_board (member_num, "
						+ "estimate_content, estimate_date, pre_price, pre_estimate_time, addr1, addr2, distance) values(?,?, now(),?,?,?,?,?)";	
				stmt=con.prepareStatement(sql);
				
				stmt.setInt(1, board.getMember_num());
				stmt.setString(2, board.getEstimate_content());
				stmt.setInt(3, board.getPre_price());
				stmt.setInt(4, board.getPre_estimate_time());
				stmt.setString(5,board.getAddr1());
				stmt.setString(6, board.getAddr2());
				stmt.setDouble(7, board.getDistance());
				
				stmt.executeUpdate();	
				
				estimate_board_num=getEstimate_board_num();
				
				
			} catch (SQLException e) {
				System.out.println("insertBoardEstimate 오류 : "+e);
			}finally{
				pool.freeConnection(con, stmt);
			}
			return estimate_board_num;
		
		
	}
	
	
	//가장 최근 등록된 견적 번호 반환. 이를 사진 저장에 활용
	public int getEstimate_board_num(){
		int estimate_board_num = 0;
		
		try {
			con=pool.getConnection();
			
			sql="SELECT max(estimate_board_num) FROM estimate_board;";
			
			stmt=con.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				estimate_board_num = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
	
		return estimate_board_num;
	}
	
	
	//사진 등록
	public void insertPicture(PictureDto dto){
		sql="insert into picture (member_num, img, estimate_board_num) values(?,?,?)";
		
		try{
			con=pool.getConnection();
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, dto.getMember_num());
			stmt.setString(2, dto.getImg());
			stmt.setInt(3, dto.getEstimate_board_num());
			
			stmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertPicture 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
	
	}
	
	
	//해당 회원이 작성한 모든 견적 가져오기.
	public Vector getBoard(int num) throws Exception{
		Vector<EstimateDto> estimates = new Vector();
		sql="select estimate_board_num, estimate_content, estimate_date from estimate_board where member_num=?";
		
		try {
			con=pool.getConnection();

			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, num);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				EstimateDto dto=new EstimateDto();
				dto.setEstimate_board_num(rs.getInt(1));
				dto.setEstimate_content(rs.getString(2));
				dto.setEstimate_date(rs.getString(3));
				dto.setMember_num(num);
				
				estimates.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("UpdateBoard 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return estimates;
	}
	
	
	
	//해당 번호의 견적 가져오기.
	public EstimateDto getEstimate(int num){
		EstimateDto dto = new EstimateDto();
		sql="select estimate_board_num, estimate_content, estimate_date, member_num from estimate_board where estimate_board_num=?";
		
		try {
			try {
				con=pool.getConnection();
			} catch (Exception e) {
				System.out.println("getestimate안의con오류"+e);
			}

			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, num);
			rs=stmt.executeQuery();
			
			while(rs.next()){
				dto.setEstimate_board_num(rs.getInt(1));
				dto.setEstimate_content(rs.getString(2));
				dto.setEstimate_date(rs.getString(3));
				dto.setMember_num(rs.getInt(4));				
			}
			
		} catch (SQLException e) {
			System.out.println("getEstimate 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	
	
	
	//견적 삭제하기.
	public void deleteBoard(EstimateDto board) throws Exception{
		String pass=null;		
		
		try {
			
			con=pool.getConnection();
			
			sql = "Delete from estimate_board where estimate_board_num=?";
				
			stmt=con.prepareStatement(sql);
			
			stmt.setInt(1, board.getEstimate_board_num());
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("Estimateboarddelete 오류 : "+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}

		
	}
	
	
	
	//주소간 거리 구하기.
	public double getDistance(EstimateDto dto){
		String sql = "SELECT ROUND(6371 * ACOS(COS(RADIANS(?))"
				+ "*COS(RADIANS(?))*COS(RADIANS(?)-RADIANS(?))+SIN(RADIANS(?))*SIN(RADIANS(?))),2)AS DISTANCE";
		double distance = 0;
		
		try {
			con=pool.getConnection();
			
			stmt=con.prepareStatement(sql);
			stmt.setDouble(1, dto.getN_lat());
			stmt.setDouble(2, dto.getL_lat());
			stmt.setDouble(3, dto.getL_lng());
			stmt.setDouble(4, dto.getN_lng());
			stmt.setDouble(5, dto.getN_lat());
			stmt.setDouble(6, dto.getL_lat());
			System.out.println("test");
			
			rs=stmt.executeQuery();
			
			while(rs.next()){
				distance=rs.getDouble("DISTANCE");
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return distance;
	}
	
	
	
	//견적 수정하기.
	public void UpdateEstimate(EstimateDto dto){
		try {
			con=pool.getConnection();
			sql="update estimate_board set estimate_content=?, addr1=?, addr2=?, pre_price=?, distance=? where estimate_board_num=?";
			
			stmt=con.prepareStatement(sql);
			stmt.setString(1, dto.getEstimate_content());
			stmt.setString(2, dto.getAddr1());
			stmt.setString(3, dto.getAddr2());
			stmt.setInt(4, dto.getPre_price());
			stmt.setDouble(5, dto.getDistance());
			stmt.setInt(6, dto.getEstimate_board_num());
			
			stmt.executeUpdate();
		
		
		} catch (Exception e) {
			System.out.println("updateEstiate오류"+e);
		}
	}
	
}
