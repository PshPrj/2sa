/*

 	��� : ��ȿ��
	���� ���� ���� : 6/2
	���� �Խ����� ���� ù �������� �̵�

 */

package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class EstimateCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/move_estimate.jsp");
		return "ESTIMATE";	
	}

}
