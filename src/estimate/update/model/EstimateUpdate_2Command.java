/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� 2 �������� �̵�

 */

package estimate.update.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class EstimateUpdate_2Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate_update/estimateUpdate_2.jsp");

		//���� �������� �Ѿ �� ������Ų ���� �����Ϳ� ������ ������, ���� ��ȣ�� �ѱ��.
		req.setAttribute("JsonData", req.getParameter("JsonData"));
		req.setAttribute("estimate_board_num", req.getParameter("estimate_board_num"));
		req.setAttribute("estimate_content", req.getParameter("estimate_content"));
		return "ESTIMATE";
	}

}
