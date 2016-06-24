/*

 	담당 : 정효진
	최종 수정 일자 : 6/08
	공지 수정 Command

 */

package notice.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;

public class NUpdateCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/Update.jsp");//공지 수정 페이지
		
		req.setAttribute("keyWord", req.getParameter("keyWord"));
		req.setAttribute("keyField",req.getParameter("keyField"));
		
		req.setAttribute("dto", getRead(req));//수정할 공지 읽어오기
	
		return "NOTICE";
	}
	
public NoticeBoardDto getRead(HttpServletRequest req){
		
		NoticeBoardDto dto = new NoticeBoardDto();
		NoticeBoardDao dao = new NoticeBoardDao();
		
		dto.setNotice_board_num(Integer.parseInt(req.getParameter("notice_board_num")));
		
		try {
			dto=dao.getBoard(dto.getNotice_board_num(), false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("NREADCommand 에러"+e);
		}
		
		return dto;
	}

}
