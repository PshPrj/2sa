/*

 	담당 : 정효진
	최종 수정 일자 : 6/7
	공지 게시판 첫 페이지로 이동

 */

package board.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import move.db.NoticeBoardDao;
import move.db.NoticeBoardDto;
import move.db.PageDto;

public class NoticeCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../company/company_notice.jsp");

		NoticeBoardDao dao = new NoticeBoardDao();
		NoticeBoardDto dto = new NoticeBoardDto();
		PageDto pdto = new PageDto();
		
		
		String keyField = req.getParameter("keyField");
		String keyWord = req.getParameter("keyWord");
		String reload = req.getParameter("reload");
		
		if(keyField == null){
			keyField = "notice_subject";
			keyWord = "";
		}
		
		if(reload != null){
			if(reload.equals("true")){
				keyWord = "";
			}
		}
		
		req.setAttribute("keyField", keyField);
		req.setAttribute("keyWord", keyWord);
		
		
		Vector list=new Vector();
		try {
			list = dao.BoardList(keyField, keyWord);
		} catch (Exception e1) {
			System.out.println("NoticeCommand "+e1);
		}
		
		req.setAttribute("list", list);
		
		int todayPage=0;
		try {
			todayPage = dao.todayBoard();
		} catch (Exception e) {
			System.out.println("noticetodaypage오류 "+e);
		}
		
		req.setAttribute("todayPage", todayPage);
		
		int totalRecord = 0;
		int numPerPage = 6;
		int pagePerBlock = 5;
		int totalPage = 0;
		int totalBlock = 0;
		int nowPage = 0;
		int nowBlock = 0;
		int beginPerPage = 0;
		
		totalRecord = list.size();
		System.out.println(totalRecord+"totalRecord");
		totalPage = ((int)Math.ceil((double)totalRecord/numPerPage));
		
		if(req.getParameter("nowPage") != null)
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		
		if(req.getParameter("nowBlock") != null)
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		
		totalBlock = ((int)Math.ceil((double)totalPage/pagePerBlock));
		
		beginPerPage = nowPage * numPerPage;
		
		pdto.setTotalRecord(totalRecord);
		pdto.setTotalPage(totalPage);
		pdto.setNowPage(nowPage);
		pdto.setNowBlock(nowBlock);
		pdto.setTotalBlock(totalBlock);
		pdto.setBeginPerPage(beginPerPage);
		
		req.setAttribute("pdto", pdto);
		
		return "NOTICE";
	}
}
