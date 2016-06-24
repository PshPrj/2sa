/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���Ǳ� ���� Command

 */


package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QUpdateCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/qna_Update.jsp");//�ʿ��� �����͸� ���� �������� �ѱ��.
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		
		//�����ϰ� ���� ��ȣ�� ���Ǳ��� �о��.
		dto.setQna_board_num(Integer.parseInt((String)req.getParameter("qna_board_num")));
		
		dto = dao.read(dto, false);
		
		req.setAttribute("dto",dto);
		
		return "QNA";
	}

}
