/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	문의글 수정 과정 Command

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
		
		//수정 데이터를 받아온다.
		dto.setQna_board_num(Integer.parseInt(req.getParameter("qna_board_num")));
		dto.setQna_subject((String)req.getParameter("qna_subject"));
		dto.setQna_content((String)req.getParameter("qna_content"));
		
		try {
			dao.updateBoard(dto);//수정
		} catch (Exception e) {
			System.out.println("qnaboardupdate에러"+e);
		}
		
		return "QNA";
	}

}
