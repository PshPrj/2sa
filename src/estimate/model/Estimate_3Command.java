/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� 3 �������� �̵�

 */

package estimate.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;

public class Estimate_3Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate/estimate_3.jsp");
		return "ESTIMATE";
	}

}
