package mypage.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.db.MyPageDao;
import mypage.db.PictureDto;
import mypage.db.StuffListDto;

public class StuffCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("boardpage","STUFF");
		MyPageDao dao = new MyPageDao(Integer.parseInt(req.getSession().getAttribute("member_num").toString()));
		ArrayList<StuffListDto> itemList = dao.getItemList();
		ArrayList<PictureDto> pictureList = dao.getPictureList();
		
 		req.setAttribute("itemList", itemList);
 		req.setAttribute("pictureList", pictureList);
		
		return "mypage/member/stuffList.jsp";
	}
}
