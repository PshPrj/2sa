package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Member_Dto;
import staff.db.Member_searchtext_Dto;
import staff.db.staff_Dao;

public class Member_Command implements Command{

	private int totalRecord = 0; // 전체 글의갯수를 가져옴
	private int numPerpage = 5;// 한페이지당 뿌려질 글의 갯수
	private int pagePerBlock = 5; // 페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	// 여기서는 5페이지를 하나로
	private int totalPage = 0; // 전체 몇 페이지냐
	private int totalBlock = 0;
	private int nowPage = 0;// 현재 페이지의 위치
	private int nowBlock = 0;
	private int beginPerPage = 0; // 페이지의 시작번호(1부터5, 6부터10...
	private String params;
	private String id = null, name=null, refund = null, member_num = null,date1=null,date2=null,history=null;
	private String subsql = "";
	staff_Dao dao = new staff_Dao();
	
	private String set_sql() {
		
		String sql = "";
		
		if (params != null) {

			if (!id.equals("")) {

				sql += " and member_id like '%" + id + "%'";

			}

			if (!name.equals("")) {

				sql += " and  member_name like '%" +name + "%'";

			}

			if (!member_num.equals("")) {

				sql += " and  m.member_num =" + member_num;

			}
			
			if(!refund.equals("")){
				sql+=" and refund_cnt = "+refund;
			}

			if(!history.equals("")){
				sql+=" and history_cnt = "+history;
			}
		
			if (!date1.equals("") && !date2.equals("")) {

				sql += " and regi_date >= '" + date1 + "' and  regi_date <= '" + date2 + "'";

			} else if (!date1.equals("")) {

				sql += " and regi_date >= '" + date1 + "'";

			} else if (!date2.equals("")) {

				sql += " and regi_date <= '" + date2 + "'";

			}

		}
		return sql;
	}
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		params = req.getParameter("params");
		id = req.getParameter("id");
		name=req.getParameter("name");
		member_num = req.getParameter("member_num");
		refund=req.getParameter("refund");
		history=req.getParameter("history");
		date1=req.getParameter("date1");
		date2=req.getParameter("date2");
		
		req.setAttribute("id", id);
		req.setAttribute("name", name);
		req.setAttribute("member_num", member_num);
		req.setAttribute("refund", refund);
		req.setAttribute("history",history);
		req.setAttribute("date1", date1);
		req.setAttribute("date2", date2);
		req.setAttribute("params", params);
		
		subsql=set_sql();
		
		Vector<Member_Dto> data=dao.get_MemberData(subsql);
		
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();	
		
		Vector<Member_Dto> list=new Vector<>();
		
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
		req.setAttribute("boardpage","MEMBER");
		return "mypage/staff/member/content/client_info.jsp";
	}

}
