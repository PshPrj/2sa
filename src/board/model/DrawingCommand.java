/*

 	��� : ��ȿ��
	���� ���� ���� : 6/7
	��ġ�� �Խ��� ù ��° �������� �̵�

 */

package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class DrawingCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/drawing/drawing_1.jsp");
		return "DRAWING";	
	}
}
