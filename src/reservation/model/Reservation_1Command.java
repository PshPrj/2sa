/*

 	��� : ��ȿ��
	���� ���� ���� : 6/15
	���� Command

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
		req.setAttribute("board", "../move/reservation/reservation_1.jsp");//���� 1�������� �Ѿ��.
		
		ReservationDto dto = new ReservationDto();
		ReservationDao dao = new ReservationDao();
		dto.setMember_num(Integer.parseInt( req.getParameter("member_num")));
		
		//�ش� ȸ���� ����� ���� ������ �޾ƿ´�.
		ArrayList<ReservationDto> estimate_dto = dao.searchEstimate(dto);
		//ArrayList template_dto = dao.searchDrawing(dto);//�ش� ������ ��ġ�� ��������.
		
		
		//������ ��ġ�� ���� �ѱ��.
		req.setAttribute("estimate_dto", estimate_dto);
		//req.setAttribute("template_dto", template_dto);

		return "RESERVATION";
	}

}
