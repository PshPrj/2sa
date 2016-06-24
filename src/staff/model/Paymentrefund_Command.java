package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Payment_Confirm_Dto;
import staff.db.Paymentconfirm_Search_Dto;
import staff.db.Paymentrefund_Dto;
import staff.db.Paymentrefund_Search_Dto;
import staff.db.staff_Dao;

public class Paymentrefund_Command implements Command {
	private int totalRecord = 0; // 전체 글의갯수를 가져옴
	private int numPerpage = 5;// 한페이지당 뿌려질 글의 갯수
	private int pagePerBlock = 5; // 페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	// 여기서는 3페이지를 하나로
	private int totalPage = 0; // 전체 몇 페이지냐
	private int totalBlock = 0;
	private int nowPage = 0;// 현재 페이지의 위치
	private int nowBlock = 0;
	private int beginPerPage = 0; // 페이지의 시작번호(1부터5, 6부터10...
	private String params;
	private staff_Dao dao=new staff_Dao();
	private String id = null, price1 = null, price2 = null, board_num = null, member_num = null;
	private String subsql="";

	private String set_sql() {
		String sql = "";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and m.member_id like '%" + id + "%'";

			}

			if (!board_num.equals("")) {

				sql += " and  e.estimate_board_num =" + board_num;

			}

			if (!member_num.equals("")) {

				sql += " and  m.member_num =" + member_num;

			}

			if (!price1.equals("") && !price2.equals("")) {

				sql += " and p.price >= '" + price1 + "' and  p.price <= '" + price2 + "'";

			} else if (!price1.equals("")) {

				sql += " and p.price >= '" + price1 + "'";

			} else if (!price2.equals("")) {

				sql += " and p.price <= '" + price2 + "'";

			}

		}
		return sql;
	}
	
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		params = req.getParameter("params");
		id = req.getParameter("id");
		member_num = req.getParameter("member_num");
		board_num = req.getParameter("board_num");
		price1 = req.getParameter("price1");
		price2 = req.getParameter("price2");

		System.out.println(id + " " + member_num + " " + price1 + " " + price2 + " " + board_num);

		Paymentrefund_Search_Dto text = new Paymentrefund_Search_Dto(id, price1, price2, member_num, board_num);
		req.setAttribute("text", text);
		req.setAttribute("params", params);
		
		subsql = set_sql();
		
		
		Vector<Paymentrefund_Dto> data=dao.get_PaymentrefundData(subsql);
		
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();
		
		Vector<Paymentrefund_Dto> list = new Vector<>();

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
		req.setAttribute("pagePerBlock", pagePerBlock);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("boardpage","PAYMENT_REFUND");
		return "mypage/staff/payment/content/payment_refund.jsp";
	}

}
