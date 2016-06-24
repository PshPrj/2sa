/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	�������� 1 �������� �̵�

 */

package estimate.update.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;

public class EstimateUpdate_1Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate_update/estimateUpdate_1.jsp");
		
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		
		//���� ��ȣ�� �ѱ��.
		dto.setEstimate_board_num(Integer.parseInt((String)req.getParameter("estimate_board_num")));
		
		
		//���� ��ȣ�� ���� ����� ���� ������ ��������.
		dto=dao.getEstimate(dto.getEstimate_board_num());
		
		req.setAttribute("dto", dto);
		
		return "ESTIMATE";
	}

}
