package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Payment_Confirm_Dto;
import staff.db.Paymentconfirm_Search_Dto;
import staff.db.staff_Dao;

public class Paymentconfirm_Command implements Command {
	private int totalRecord = 0; // ��ü ���ǰ����� ������
	private int numPerpage = 5;// ���������� �ѷ��� ���� ����
	private int pagePerBlock = 5; // ������ �̵�(������ : ���� 10������, ���� 10������ �̷�������)
	// ���⼭�� 3�������� �ϳ���
	private int totalPage = 0; // ��ü �� ��������
	private int totalBlock = 0;
	private int nowPage = 0;// ���� �������� ��ġ
	private int nowBlock = 0;
	private int beginPerPage = 0; // �������� ���۹�ȣ(1����5, 6����10...
	private String params;
	private String id = null, price1 = null, price2 = null, board_num = null, member_num = null;
	private String subsql = "";
	staff_Dao dao = new staff_Dao();

	private String set_sql() {
		String sql = "";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and member_id like '%" + id + "%'";

			}

			if (!board_num.equals("")) {

				sql += " and  estimate_board_num =" + board_num;

			}

			if (!member_num.equals("")) {

				sql += " and  m.member_num =" + member_num;

			}

			if (!price1.equals("") && !price2.equals("")) {

				sql += " and pre_price >= '" + price1 + "' and  pre_price <= '" + price2 + "'";

			} else if (!price1.equals("")) {

				sql += " and pre_price >= '" + price1 + "'";

			} else if (!price2.equals("")) {

				sql += " and pre_price <= '" + price2 + "'";

			}

		}
		return sql;
	}

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		params = req.getParameter("params");
		id = req.getParameter("id");
		member_num = req.getParameter("member_num");
		board_num = req.getParameter("num");
		price1 = req.getParameter("price1");
		price2 = req.getParameter("price2");

		

		Paymentconfirm_Search_Dto text = new Paymentconfirm_Search_Dto(id, price1, price2, member_num, board_num);
		req.setAttribute("text", text);
		req.setAttribute("params", params);
		
		subsql = set_sql();

		Vector<Payment_Confirm_Dto> data = dao.get_PaymentConfirmData(subsql);

		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();

		Vector<Payment_Confirm_Dto> list = new Vector<>();

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
		req.setAttribute("boardpage", "PAYMENT_CONFIRM");
		return "mypage/staff/payment/content/payment_confirm.jsp";
	}

}
