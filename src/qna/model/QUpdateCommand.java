/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	문의글 수정 Command

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
		req.setAttribute("board", "../community/qna_Update.jsp");//필요한 데이터를 수정 페이지로 넘긴다.
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		
		//수정하고 싶은 번호의 문의글을 읽어간다.
		dto.setQna_board_num(Integer.parseInt((String)req.getParameter("qna_board_num")));
		
		dto = dao.read(dto, false);
		
		req.setAttribute("dto",dto);
		
		return "QNA";
	}

}
