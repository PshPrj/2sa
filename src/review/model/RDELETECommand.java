/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
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

public class RDELETECommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_review.jsp");
		ReviewBoardDao dao = new ReviewBoardDao();
		ReviewBoardDto dto = new ReviewBoardDto();
		
		dto.setReview_board_num(Integer.parseInt((String)req.getParameter("review_board_num")));
		
		System.out.println(dto.getReview_board_num()+"����ѹ�");
		
		try {
			dao.deleteBoard(dto);
		} catch (Exception e) {
			System.out.println("reviewboarddelete����"+e);
		}
		
		return "REVIEW";
	}

}
