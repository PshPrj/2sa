/*

 	��� : ��ȿ��
	���� ���� ���� : 6/15
	���� 3������ Command

 */

package reservation.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class Reservation_3Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/reservation/reservation_3.jsp");
		return "RESERVATION";
	}

}