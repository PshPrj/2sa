/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ı� ���� Command

 */

package review.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.ReviewBoardDao;
import move.db.ReviewBoardDto;

public class RUPDATECommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/review_Update.jsp");
		
		
		//�����ϰ��� �ϴ� �ı��� ������ ��������.
		int review_board_num = Integer.parseInt((String)req.getParameter("review_board_num"));
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		ReviewBoardDto dto = new ReviewBoardDto();
		ReviewBoardDao dao = new ReviewBoardDao();
		dto.setReview_board_num(review_board_num);
		
		dto=dao.getBoard(dto, false);//�ı� ��������. ������ ���� ���̹Ƿ� false
		req.setAttribute("dto", dto);
	
		return "REVIEW";
	}
}