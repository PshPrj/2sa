/*

 	��� : ��ȿ��
	���� ���� ���� : 6/1
	���� �Խ����� ���� ù �������� �̵�

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
