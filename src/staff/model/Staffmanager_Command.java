package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Payment_Confirm_Dto;
import staff.db.Staff_Dto;
import staff.db.Staff_searchtext_Dto;
import staff.db.staff_Dao;

public class Staffmanager_Command implements Command {
	
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
	private String subsql="";
	private String params,id,name,dept,date1,date2,tel;
	
	private String set_sql() {
		String sql = "";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and staff_id like '%" + id + "%'";

			}

			if (!name.equals("")) {

				sql += " and s.staff_name like '%" + name + "%'";

			}
			
			if (!tel.equals("")) {

				sql += " and s.staff_tel like '%" + tel + "%'";

			}

			if (!dept.equals("")) {

				sql += " and  d.dept_name like '%" + dept+"%'";

			}

			if (!date1.equals("") && !date2.equals("")) {

				sql += " and regi_date_staff >= '" + date1 + "' and  regi_date_staff <= '" + date2 + "'";

			} else if (!date1.equals("")) {

				sql += " and regi_date_staff >= '" +date1 + "'";

			} else if (!date2.equals("")) {

				sql += " and regi_date_staff <= '" + date2 + "'";

			}

		}
	
		return sql;
	}
	

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		id=req.getParameter("id");
		dept=req.getParameter("dept");
		name=req.getParameter("name");
		date1=req.getParameter("date1");
		date2=req.getParameter("date2");
		tel=req.getParameter("tel");
		params=req.getParameter("params");
		
		Staff_searchtext_Dto text=new Staff_searchtext_Dto(date1, date2, name, id, dept, tel);
		
		req.setAttribute("text", text);
		req.setAttribute("params", params);
		
		subsql=set_sql();
				
		Vector<Staff_Dto> data=dao.get_StaffData(subsql);
		
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
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("boardpage","STAFF_MANAGER");
		return "mypage/staff/member/content/staff_info.jsp";
	}

}
