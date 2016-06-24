/*

 	담당 : 정효진
	최종 수정 일자 : 6/16
	문의글 답변 절차 Command

 */


package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QReplyProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/community_qna.jsp");
		
		QNABoardDto dto = new QNABoardDto();
		QNABoardDao dao = new QNABoardDao();
		
		
		//받아온 답변글 정보 dto에 등록
		dto.setQna_subject(req.getParameter("qna_subject"));
		dto.setQna_content(req.getParameter("qna_content"));
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setQna_board_num(Integer.parseInt(req.getParameter("qna_board_num")));
		System.out.println(Integer.parseInt(req.getParameter("qna_board_num"))+"board_num");
		dto.setIs_confirm(true);//답변글이므로 무조건 confirm되도록
		dto.setIs_secret(true);//답변글은 무조건 비밀글
		
		try {
			dao.replyBoard(dto);//답변글 등록
		} catch (Exception e) {
			System.out.println("replyqna오류"+e);
		}
		
		
		
		return "QNA";
	}

}
