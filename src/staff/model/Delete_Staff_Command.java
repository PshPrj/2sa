package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Staff_Dto;
import staff.db.staff_Dao;

public class Delete_Staff_Command implements Command {
	
	private int totalRecord = 0; // 전체 글의갯수를 가져옴
	private int numPerpage = 5;// 한페이지당 뿌려질 글의 갯수
	private int pagePerBlock = 5; // 페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	// 여기서는 3페이지를 하나로
	private int totalPage = 0; // 전체 몇 페이지냐
	private int totalBlock = 0;
	private int nowPage = 0;// 현재 페이지의 위치
	private int nowBlock = 0;
	private int beginPerPage = 0; // 페이지의 시작번호(1부터5, 6부터10...
	staff_Dao dao=new staff_Dao();


	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		String staff_num=req.getParameter("staff_num");
		
		dao.Delete_Staff(staff_num);
		
		Vector<Staff_Dto> data=dao.get_StaffData("");
		
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();

		Vector<Staff_Dto> list = new Vector<>();

		for (int i = beginPerPage; i < beginPerPage + numPerpage; i++) {

			if (i == totalRecord) {
				break;
			}

			list.add(data.get(i));
		}

		totalPage = ((int) Math.ceil((double) totalRecord / numPerpage));

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("list", list);
		req.setAttribute("list_size", list.size());
		req.setAttribute("boardpage", "PAYMENT");
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("boardpage","STAFF_MANAGER");
		return "mypage/staff/member/content/staff_info.jsp";
	}

}
