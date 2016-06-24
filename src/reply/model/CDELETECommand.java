/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	리플글 삭제 Command

 */

package reply.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.CommentDao;
import move.db.CommentDto;

public class CDELETECommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setAttribute("board", "../comment/c_proc.jsp");
		CommentDao dao = new CommentDao();
		CommentDto dto = new CommentDto();
		
		dto.setComment_num(Integer.parseInt(req.getParameter("comment_num")));
		
		dao.commentDelete(dto);//리플글 삭제.
		
		String board_nic = dao.searchBoard_nic(dto);
		
		return board_nic.toString();
	}

}
