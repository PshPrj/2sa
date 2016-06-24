/*

 	담당 : 정효진
	최종 수정 일자 : 6/016
	문의글 읽기 Command

 */

package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QReadCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/qna_Read.jsp");
		
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		QNABoardDto dto = new QNABoardDto();
		QNABoardDao dao = new QNABoardDao();
		
		
		//해당 번호의 문의글을 읽어온다.
		dto.setQna_board_num(Integer.parseInt(req.getParameter("qna_board_num")));
		
		dto=dao.read(dto, true);
		req.setAttribute("dto", dto);
		return "QNA";
	}

}
