
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/1
	ȸ�� �Ұ� �Խ��� ù �������� �̵�

 */
package board.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public class IntroduceCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/company_introduce.jsp");
		return "INTRODUCE";
	}

}
