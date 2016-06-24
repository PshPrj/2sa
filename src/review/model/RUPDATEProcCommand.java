/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	후기 수정 과정 Command

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
		
		//후기 번호와 정보를 통해 후기 수정
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