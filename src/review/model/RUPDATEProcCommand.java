/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ı� ���� ���� Command

 */

package review.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.ReviewBoardDao;
import move.db.ReviewBoardDto;

public class RUPDATEProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_review.jsp");
		
		int review_board_num = Integer.parseInt((String)req.getParameter("review_board_num"));
		
		//�ı� ��ȣ�� ������ ���� �ı� ����
		ReviewBoardDto dto = new ReviewBoardDto();
		ReviewBoardDao dao = new ReviewBoardDao();
		dto.setReview_board_num(review_board_num);
		dto.setMember_num(Integer.parseInt((String)req.getParameter("member_num")));
		dto.setReview_subject(req.getParameter("review_subject"));
		dto.setReview_content(req.getParameter("review_content"));
		
		dao.updateBoard(dto);
	
		return "REVIEW";
	}
}