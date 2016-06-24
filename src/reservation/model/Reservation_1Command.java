/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	예약 Command

 */

package reservation.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import move.db.ReservationDao;
import move.db.ReservationDto;

public class Reservation_1Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/reservation/reservation_1.jsp");//예약 1페이지로 넘어가기.
		
		ReservationDto dto = new ReservationDto();
		ReservationDao dao = new ReservationDao();
		dto.setMember_num(Integer.parseInt( req.getParameter("member_num")));
		
		//해당 회원이 등록한 견적 사항을 받아온다.
		ArrayList<ReservationDto> estimate_dto = dao.searchEstimate(dto);
		//ArrayList template_dto = dao.searchDrawing(dto);//해당 견적의 배치도 가져오기.
		
		
		//견적과 배치도 정보 넘기기.
		req.setAttribute("estimate_dto", estimate_dto);
		//req.setAttribute("template_dto", template_dto);

		return "RESERVATION";
	}

}
