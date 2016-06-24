/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	리플글 수정 Command

 */

package reply.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.CommentDao;
import move.db.CommentDto;

public class CUPDATECommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../comment/c_proc.jsp");
		
		CommentDao dao = new CommentDao();
		CommentDto dto = new CommentDto();
		
		
		//수정할 리플의 데이터 받아오기.
		dto.setComment_content(req.getParameter("comment_content"));
		dto.setComment_num(Integer.parseInt(req.getParameter("comment_num")));
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		
		dao.commentUpdate(dto);//수정
		
		String board_nic=dao.searchBoard_nic(dto);
		
		return board_nic.toString();//리플을 등록한 게시판 이름 return.
	}

}
