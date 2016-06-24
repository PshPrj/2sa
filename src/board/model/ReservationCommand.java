/*

 	담당 : 정효진
	최종 수정 일자 : 6/1
	견적 게시판의 가장 첫 페이지로 이동

 */

package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class ReservationCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/move_reservation.jsp");
		return "RESERVATION";
	}

}
