package staff.model;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Paymentwait_Dto;
import staff.db.Paymentwait_searchtext_Dto;
import staff.db.staff_Dao;

public class Paymentwait_Command implements Command {
	
	private int totalRecord = 0; // 전체 글의갯수를 가져옴
	private int numPerpage = 5;// 한페이지당 뿌려질 글의 갯수
	private int pagePerBlock = 3; // 페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	// 여기서는 3페이지를 하나로
	private int totalPage = 0; // 전체 몇 페이지냐
	private int totalBlock = 0;
	private int nowPage = 0;// 현재 페이지의 위치
	private int nowBlock = 0;
	private int beginPerPage = 0; // 페이지의 시작번호(1부터5, 6부터10...
	private String params;
	private String id = null, price1 = null, price2 = null, board_num = null, member_num = null,date1=null,date2=null;
	private String subsql = "";
	staff_Dao dao = new staff_Dao();
	Calendar cal=Calendar.getInstance();
	Calendar cal2=Calendar.getInstance();	
	private int cnt;

	private String set_sql() {
		String sql = "";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and m.member_id like '%" + id + "%'";

			}

			if (!board_num.equals("")) {

				sql += " and  estimate_board_num like '%" +board_num + "%'";

			}

			if (!member_num.equals("")) {

				sql += " and  m.member_num =" + member_num;

			}

			if (!price1.equals("") && !price2.equals("")) {

				sql += " and price >= '" + price1 + "' and  price <= '" + price2 + "'";

			} else if (!price1.equals("")) {

				sql += " and price >= '" + price1 + "'";

			} else if (!price2.equals("")) {

				sql += " and price <= '" + price2 + "'";

			}
			
			if (!date1.equals("") && !date2.equals("")) {

				sql += " and p.payment_deadline >= '" + date1 + "' and  p.payment_deadline <= '" + date2 + "'";

			} else if (!date1.equals("")) {

				sql += " and p.payment_deadline >= '" + date1 + "'";

			} else if (!date2.equals("")) {

				sql += " and p.payment_deadline <= '" + date2 + "'";

			}

		}
		return sql;
	}
	
	
	public String get_deadline(String date,Paymentwait_Dto dto){		
		String dead = null;
		
		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(date);
			cal2.setTime(to);	
			cal.setTime(to);
			cal.add(Calendar.DATE, 3);
			cnt=cal.compareTo(cal2);			
			dead=cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH)+"-"+cal.get(Calendar.DATE);			
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dead;
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		params = req.getParameter("params");
		id = req.getParameter("id");
		member_num = req.getParameter("member_num");
		board_num = req.getParameter("board_num");
		price1 = req.getParameter("price1");
		price2 = req.getParameter("price2");
		date1=req.getParameter("date1");
		date2=req.getParameter("date2");
		
		Paymentwait_searchtext_Dto text = new Paymentwait_searchtext_Dto(id, price1, price2, board_num, member_num, date1, date2);
		req.setAttribute("text", text);
		req.setAttribute("params", params);
		
		subsql=set_sql();
		
		Vector<Paymentwait_Dto> data=dao.get_PaymentwaitData(subsql);
		
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();	
		
		Vector<Paymentwait_Dto> list = new Vector<>();

		for (int i = beginPerPage; i < beginPerPage + numPerpage; i++) {

			if (i == totalRecord) {
				break;
			}

			String deadline_date=data.get(i).getDate();			
			data.get(i).setDedline_date(get_deadline(deadline_date, data.get(i)));
			data.get(i).setDedline(cnt);
			list.add(data.get(i));
		}

		totalPage = ((int) Math.ceil((double) totalRecord / numPerpage));

		totalBlock = ((int) Math.ceil((double) totalPage / pagePerBlock));

		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("list", list);
		req.setAttribute("list_size", list.size());
		req.setAttribute("beginPerPage", beginPerPage);
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("boardpage","PAYMENT_WAIT");
		return "mypage/staff/payment/content/payment_wait.jsp";
	}

}
