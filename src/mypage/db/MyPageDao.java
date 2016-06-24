package mypage.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import move.dbcp.DBconnectionMgr;

public class MyPageDao {
	private DBconnectionMgr pool;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private int member_num;

	public MyPageDao() {
	}

	public MyPageDao(int member_num) {
		this.member_num = member_num;
	}

	public ArrayList<TruckContainerDto> getTruckList() {
		String sql = "select * from 2sa.truck t join 2sa.payment p on t.truck_num = p.truck_num join 2sa.staff s on t.staff_num = s.staff_num where p.member_num = "
				+ member_num;
		ArrayList<TruckContainerDto> list = new ArrayList<TruckContainerDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				TruckContainerDto dto = new TruckContainerDto();
				dto.setTruck_num(rs.getInt("truck_num"));
				dto.setStaff_num_tr(rs.getInt("staff_num"));
				dto.setPayment_num(rs.getInt("payment_num"));
				dto.setTruck_capacity(rs.getInt("truck_capacity"));
				dto.setCar_type(rs.getString("car_type"));
				dto.setCar_num(rs.getString("car_num"));
				dto.setRegi_date_truck(rs.getDate("regi_date_truck").toString());
				dto.setStaff_name_tr(rs.getString("staff_name"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public ArrayList<TruckContainerDto> getContainerList() {
		String sql = "select * from 2sa.container c join 2sa.payment p on c.container_num = p.container_num join 2sa.staff s on c.staff_num = s.staff_num where p.member_num = "
				+ member_num;
		ArrayList<TruckContainerDto> list = new ArrayList<TruckContainerDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				TruckContainerDto dto = new TruckContainerDto();
				dto.setContainer_num(rs.getInt("container_num"));
				dto.setStaff_num_con(rs.getInt("staff_num"));
				dto.setContainer_capacity(rs.getInt("container_capacity"));
				dto.setRegi_date_container(rs.getDate("regi_date_container").toString());
				dto.setStaff_name_con(rs.getString("staff_name"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public ArrayList<PaymentDto> getPaymentList() {
		String sql = "select * from 2sa.payment p join 2sa.member m on p.member_num = m.member_num join 2sa.reservation r on p.reservation_num = r.reservation_num join 2sa.estimate_board e on r.estimate_board_num = e.estimate_board_num where m.member_num = "
				+ member_num;
		ArrayList<PaymentDto> list = new ArrayList<PaymentDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				PaymentDto dto = new PaymentDto();
				dto.setPayment_num(rs.getInt("payment_num"));
				dto.setPrice(rs.getInt("price"));
				dto.setPayment_date(rs.getString("payment_date"));
				dto.setPayment_type(rs.getInt("payment_type"));
				dto.setCash_bill(rs.getInt("cash_bill"));
				dto.setMember_num(rs.getInt("member_num"));
				dto.setIs_refund(rs.getInt("is_refund"));
				dto.setRefund_check(rs.getInt("refund_check"));
				dto.setReservation_num(rs.getInt("reservation_num"));
				dto.setPayment_deadline(rs.getDate("payment_deadline").toString());
				dto.setMember_name(rs.getString("member_name"));
				dto.setReservation_date(rs.getDate("reservation_date").toString());
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public void payConfirm(int reservation_num, String payment_type) {
		int ipayment_type = 0;

		if (payment_type.equals("credit")) {
			ipayment_type = 1;
		} else if (payment_type.equals("transfer")) {
			ipayment_type = 2;
		} else if (payment_type.equals("naver")) {
			ipayment_type = 3;
		} else if (payment_type.equals("payco")) {
			ipayment_type = 4;
		}

		String sql = "update 2sa.payment set payment_date = sysdate(), payment_type = ? where reservation_num = "
				+ reservation_num;

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, ipayment_type);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
	}

	public void refundRequest(int reservation_num) {
		String sql = "update 2sa.payment set is_refund = ? where reservation_num = " + reservation_num;

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, 1);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
	}

	public ArrayList<ReservationDto> getReservationList() {
		String sql = "select * from 2sa.reservation where member_num = " + member_num;
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ReservationDto dto = new ReservationDto();
				dto.setReservation_num(rs.getInt("reservation_num"));
				dto.setReservation_date(rs.getDate("reservation_date").toString());
				dto.setIs_confirm(rs.getInt("is_confirm"));
				dto.setTemplate(rs.getBoolean("template"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("MyPageDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public ArrayList<StuffListDto> getItemList() {
		String sql = "SELECT * FROM 2sa.estimate_board where member_num = " + member_num;
		ArrayList<StuffListDto> list = new ArrayList<StuffListDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				StuffListDto dto = new StuffListDto();
				dto.setEstimate_content(rs.getString("estimate_content").trim().replaceAll("_", " "));
				dto.setEstimate_board_num(rs.getInt("estimate_board_num"));
				dto.setEstimate_date(rs.getString("estimate_date"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("getItemList : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}
	public ArrayList<PictureDto> getPictureList() {
		String sql = "SELECT * FROM 2sa.picture where member_num = " + member_num;
		ArrayList<PictureDto> list = new ArrayList<PictureDto>();
		
		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				PictureDto dto = new PictureDto();
				dto.setEstimate_board_num(rs.getInt("estimate_board_num"));
				dto.setImg(rs.getString("img"));
				dto.setPicture_num(rs.getInt("picture_num"));
				
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("PictureList : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public ArrayList<ProgressDto> getProgressList() {
		String sql = "select * from 2sa.movement_status m join 2sa.payment p on m.payment_num = p.payment_num where p.member_num = " + member_num;
		ArrayList<ProgressDto> list = new ArrayList<ProgressDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProgressDto dto = new ProgressDto();
				if (rs.getDate("movement_statrt_time") != null) {
					dto.setMovement_start_time(rs.getString("movement_statrt_time"));
				} else {
					dto.setMovement_start_time("");
				}

				if (rs.getDate("truck_leave_time") != null) {
					dto.setTruck_leave_time(rs.getString("truck_leave_time"));
				} else {
					dto.setTruck_leave_time("");
				}

				if (rs.getDate("depart_time") != null) {
					dto.setDepart_time(rs.getString("depart_time"));
				} else {
					dto.setDepart_time("");
				}

				if (rs.getDate("complete_time") != null) {
					dto.setComplete_time(rs.getString("complete_time"));
				} else {
					dto.setComplete_time("");
				}
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			// System.out.println("MyPageDao : " + e);
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public boolean passwordChk(String pw) {
		String sql = "select member_pw from 2sa.member where member_num = " + member_num;

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				if (rs.getString("member_pw").equals(pw)) {
					return true;
				}
			}

		} catch (Exception e) {
			System.out.println("modifyDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}

		return false;
	}

	public ModifyDto getModifyDto() {
		String sql = "select * from 2sa.member where member_num = " + member_num;

		pool = DBconnectionMgr.getInstance();
		try {
			ModifyDto dto = new ModifyDto();
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			rs.next();

			dto.setM_num(rs.getInt("member_num"));
			dto.setM_id(rs.getString("member_id"));
			dto.setM_pw(rs.getString("member_pw"));
			dto.setM_name(rs.getString("member_name"));
			dto.setM_tel(rs.getString("member_tel"));


			return dto;
		} catch (Exception e) {
			System.out.println("modifyDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}

	public void Update(ModifyDto dto) {
		String sql = "Update 2sa.member set member_pw=?, member_tel=? where member_num = " + member_num;
		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);

			ps.setString(1, dto.getM_pw());
			ps.setString(2, dto.getM_tel());

			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("수정 실패 : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
	}

	public ArrayList<FloorplanDto> getFloorplanList() {
		String sql = "select * from 2sa.template where member_num = " + member_num;
		ArrayList<FloorplanDto> list = new ArrayList<FloorplanDto>();

		pool = DBconnectionMgr.getInstance();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				FloorplanDto dto = new FloorplanDto();

				dto.setTemplate_num(rs.getInt("template_num"));
				dto.setImg_name(rs.getString("img_name"));
				dto.setRegi_date_draw(rs.getString("regi_date_draw"));

				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("modifyDao : " + e);
		} finally {
			pool.freeConnection(con, ps, rs);
		}
		return null;
	}
}
