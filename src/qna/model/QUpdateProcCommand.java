/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���Ǳ� ���� ���� Command

 */


package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QUpdateProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_qna.jsp");
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		//���� �����͸� �޾ƿ´�.
		dto.setQna_board_num(Integer.parseInt(req.getParameter("qna_board_num")));
		dto.setQna_subject((String)req.getParameter("qna_subject"));
		dto.setQna_content((String)req.getParameter("qna_content"));
		
		try {
			dao.updateBoard(dto);//����
		} catch (Exception e) {
			System.out.println("qnaboardupdate����"+e);
		}
		
		return "QNA";
	}

}
