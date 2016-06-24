/*

 	담당 : 정효진
	최종 수정 일자 : 6/07
	문의글 등록 과정 Command

 */

package qna.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.QNABoardDao;
import move.db.QNABoardDto;

public class QPOSTProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../community/PostProc2.jsp");
		
		QNABoardDao dao = new QNABoardDao();
		QNABoardDto dto = new QNABoardDto();
		
		
		//받아온 회원 번호, 제목, 내용을 등록
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		dto.setQna_subject(req.getParameter("qna_subject"));
		dto.setQna_content(req.getParameter("qna_content"));
		
		if(req.getParameter("is_secret")!=null){//비밀글 설정
			dto.setIs_secret(true);
		}else{
			dto.setIs_secret(false);
		}
		
		try {
			dao.insertBoard(dto);//문의 등록하기.
		} catch (Exception e) {
			System.out.println("insertqna에러"+e);
		}
		
		return "QNA";
	}
	
}
