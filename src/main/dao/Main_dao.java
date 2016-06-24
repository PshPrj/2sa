/*

 	담당 : 윤초희
	최종 수정 일자 : 6/21
	main 페이지  DB 접속

 */

package main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import main.dto.Calendar_Main_Dto;
import move.dbcp.DBconnectionMgr;
import staff.db.Stastistictrcuk_Dto;

public class Main_dao {

	private Connection con;
	private PreparedStatement stmt;
	private DBconnectionMgr pool;
	private ResultSet rs;
	private String sql;

	public Main_dao() {
		try {
			pool = DBconnectionMgr.getInstance();
		} catch (Exception err) {
			System.out.println("DB 연결 객체 생성 실패 : " + err);
		}
	}

	public Vector<Calendar_Main_Dto> get_CalendarSumData() {
		Vector<Calendar_Main_Dto> list = new Vector<>();

		try {

			sql = "select r.reservation_date, count(r.reservation_date) "
					+ " from reservation r inner join payment p on p.reservation_num=r.reservation_num "
					+ " where p.payment_date is not null and p.is_refund=false group by r.reservation_date";

			System.out.println(sql);

			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				Calendar_Main_Dto dto = new Calendar_Main_Dto();
				dto.setDate(rs.getString(1));
				dto.setCnt(rs.getString(2));
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception er) {
			er.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
			return list;
		}
	}

}
