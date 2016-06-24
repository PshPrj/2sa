/*

 	��� : ��ȿ��
	���� ���� ���� : 6/07
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

public class QDeleteCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_qna.jsp");
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		dto.setQna_board_num(Integer.parseInt((String)req.getParameter("qna_board_num")));
		
		try {
			dao.deleteBoard(dto);
		} catch (Exception e) {
			System.out.println("qnaboarddelet����"+e);
		}
		
		return "DELETE";
	}

}
