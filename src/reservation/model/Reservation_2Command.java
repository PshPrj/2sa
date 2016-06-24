/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	예약 2페이지 Command

 */

package reservation.model;

import java.io.IOException;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class Reservation_2Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/reservation/reservation_2.jsp");
		return "RESERVATION";
	}
}
