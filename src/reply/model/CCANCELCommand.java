/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	리플글 취소 Command

 */


package reply.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.CommentDao;
import move.db.CommentDto;

public class CCANCELCommand implements Command  {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../comment/c_update.jsp");
		CommentDao dao = new CommentDao();
		CommentDto dto = new CommentDto();
		
		
		//삭제하고 싶은 리플의 번호를 받아온다.
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		
		String board_nic = dao.searchBoard_nic(dto);
		
		return board_nic.toString();
	}

}
