/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ı� �б� Command

 */

package review.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.ReviewBoardDao;
import move.db.ReviewBoardDto;

public class RREADCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/review_Read.jsp");
		
		ReviewBoardDto dto = new ReviewBoardDto();
		ReviewBoardDao dao = new ReviewBoardDao();
		
		
		//���ϴ� ���� �ı⸦ ��������.
		dto.setReview_board_num(Integer.parseInt(req.getParameter("review_board_num")));
		System.out.println(dto.getReview_board_num());
		
		dto = dao.getBoard(dto, true);//�ı� �˻�.
		
		req.setAttribute("dto", dto);
		
		return "REVIEW";
	}

}
