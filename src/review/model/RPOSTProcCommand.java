/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	후기 등록 과정 Command

 */

package review.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.ReviewBoardDao;
import move.db.ReviewBoardDto;

public class RPOSTProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/PostProc.jsp");
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
			
		
		ReviewBoardDao dao = new ReviewBoardDao();
		ReviewBoardDto dto = new ReviewBoardDto();
		
		dto.setStar(Integer.parseInt(req.getParameter("star")));		
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		System.out.println(dto.getMember_num()+"member_num_command");
		dto.setReview_subject(req.getParameter("review_subject"));
		dto.setReview_content(req.getParameter("review_content"));
		
		try {
			dao.insertBoard(dto);
		} catch (Exception e) {
			System.out.println("insertreview에러"+e);
		}
		
		return "REVIEW";
	}
}
