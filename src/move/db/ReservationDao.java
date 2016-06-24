
/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	예약 dao

 */

package move.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import move.dbcp.DBconnectionMgr;
import oracle.net.aso.e;

public class ReservationDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBconnectionMgr pool;
	//private C3P0Mgr pool;
	
	String sql;
	
	public ReservationDao(){
		try{
			pool = DBconnectionMgr.getInstance();
		}catch(Exception err){
			System.out.println("DB연결객체 생성 실패 : "+err);
		}
	}
	
	
	//견적에서 게산된 pre_price가져오기.
	public int searchPrice(ReservationDto dto){
		int price=0;
		try {
			con=pool.getConnection();
			
			sql="select pre_price from estimate_board where estimate_board_num=? ";
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, dto.getEstimate_board_num());
			
			rs=stmt.executeQuery();
			
			while(rs.next()){
				price=rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("searchReservation오류"+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		
		
		return price;
	}
	
	
	
	//예약 검색
	public int searchReservation(ReservationDto dto){
		int res_num=0;
			try {
				con=pool.getConnection();
				
				sql="select * from reservation where reservation_date = ? ";
				
				stmt=con.prepareStatement(sql);
				stmt.setString(1, dto.getReservation_date());
				
				rs=stmt.executeQuery();
				
				while(rs.next()){
					res_num=rs.getInt(1);
				}
				
			} catch (Exception e) {
				System.out.println("searchReservation오류"+e);
			}finally{
				pool.freeConnection(con, stmt, rs);
			}
			
		return res_num;
	}
	
	
	/*
	//예약에 사용할 배치도 검색해오기.
	public ArrayList searchDrawing(ReservationDto dto){
		ArrayList template_num = new ArrayList();
		try {
			con=pool.getConnection();
			
			sql="select template_num from template where member_num=?";
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, dto.getMember_num());
			
			rs=stmt.executeQuery();
			
			int i =0;
			
			while(rs.next()){
				template_num.add(i, rs.getInt(i+1));
			}
			
		} catch (Exception e) {
			System.out.println("searchReservation오류"+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
	return template_num;
	}*/
	
	
	
	//예약에 사용될 수 있는 견적 검색하기.
	public ArrayList searchEstimate(ReservationDto dto){
		ArrayList<ReservationDto> searchEstimate = new ArrayList<ReservationDto>();
		try {
			con=pool.getConnection();
			
			sql="select estimate_board_num, estimate_date from estimate_board where member_num=?";
			
			stmt=con.prepareStatement(sql);
			stmt.setInt(1, dto.getMember_num());
			
			rs=stmt.executeQuery();

			
			int i =0;
			
			while(rs.next()){
				ReservationDto dto2 = new ReservationDto();
				dto2.setEstimate_board_num(rs.getInt(i+1));
				dto2.setEstimate_date(rs.getString(2));
				
				searchEstimate.add(dto2);
			}
			
		} catch (Exception e) {
			System.out.println("searchEstimate오류"+e);
		}finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return searchEstimate;
	}
	
	
	
	//예약하기
	public void insertReservation(ReservationDto dto){
		try {
			con=pool.getConnection();
			
			sql="insert into reservation (reservation_date, template, price, "
					+ "estimate_board_num, reservation_time, keep_item_date, member_num) values(?,?,?,?,?,?,?)";
			
			stmt=con.prepareStatement(sql);
			stmt.setString(1, dto.getReservation_date());
			stmt.setBoolean(2, dto.getTemplate());
			stmt.setInt(3, dto.getPrice());
			stmt.setInt(4, dto.getEstimate_board_num());
			stmt.setInt(5, dto.getReservation_time());
			stmt.setInt(6, dto.getKeep_item_date());
			stmt.setInt(7, dto.getMember_num());
			
			stmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertReservation오류"+e);
		}finally{
			pool.freeConnection(con, stmt);
		}
		
	}
}
