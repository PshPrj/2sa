package staff.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Currentres_Progress_dto;
import staff.db.staff_Dao;

public class Progress_Command implements Command{
	private int totalRecord = 0; // ��ü ���ǰ����� ������
	private int numPerpage = 5;// ���������� �ѷ��� ���� ����
	private int pagePerBlock = 5; // ������ �̵�(������ : ���� 10������, ���� 10������ �̷�������)
	// ���⼭�� 3�������� �ϳ���
	private int totalPage = 0; // ��ü �� ��������
	private int totalBlock = 0;
	private int nowPage = 0;// ���� �������� ��ġ
	private int nowBlock = 0;
	private int beginPerPage = 0; // �������� ���۹�ȣ(1����5, 6����10...
	staff_Dao dao=new staff_Dao();
	private String subsql="";
	private String id="",res_num="",dist1="",dist2="",params="";
	
	private String set_sql() {
		String sql = "";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and m.member_id like '%" + id + "%' ";

			}

			if (!res_num.equals("")) {

				sql += " and r.reservation_num= "+res_num;

			}

			if (!dist1.equals("") && !dist2.equals("")) {

				sql += " and e.distance >= " + dist1 + " and  e.distance <= " + dist2 + " ";

			} else if (!dist1.equals("")) {

				sql += " and e.distance >= " +dist1 + " ";

			} else if (!dist2.equals("")) {

				sql += " and e.distance <= " + dist2 + " ";

			}

		}
	
		return sql;
	}
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		
		id=req.getParameter("id");
		res_num=req.getParameter("res_num");
		dist1=req.getParameter("dist1");
		dist2=req.getParameter("dist2");
		params=req.getParameter("params");
		
		req.setAttribute("params", params);
		req.setAttribute("id", id);
		req.setAttribute("res_num", res_num);
		req.setAttribute("dist1", dist1);
		req.setAttribute("dist2", dist2);
		
		
		
		
		subsql=set_sql();
		Vector<Currentres_Progress_dto> data=dao.get_progressData(subsql);
		
		if (req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage = (nowPage - 1) * numPerpage;
		}

		if (req.getParameter("nowBlock") != null) {
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}

		totalRecord = data.size();
		Vector<Currentres_Progress_dto> list=new Vector<>();
		
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
		req.setAttribute("boardpage","PROGRESS");
		return "mypage/staff/progress/current_progress.jsp";
	}	

}
