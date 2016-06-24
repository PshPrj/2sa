/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	공지 수정 과정 Command

 */

package notice.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;

public class NUpdateProcCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/company_notice.jsp");//공지 수정 과정 페이지
		
		 boardupdate(req);
				
		return "NOTICE";
	}
	
	public void boardupdate(HttpServletRequest req){
		NoticeBoardDto dto = new NoticeBoardDto();
		NoticeBoardDao dao = new NoticeBoardDao();
		
		//수정사항을 받아온다.
		dto.setNotice_board_num(Integer.parseInt(req.getParameter("notice_board_num")));
		dto.setNotice_subject(req.getParameter("notice_subject"));
		dto.setNotice_content(req.getParameter("notice_content"));
		
		try {
			dao.updateBoard(dto);//공지 수정
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("updateproccommand 에러 "+e);
		}
	}

}
