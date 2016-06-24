package staff.model;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.Payment_searchtext_Dto;
import staff.db.Paymentapprove_Dto;
import staff.db.staff_Dao;

public class Payment_Command implements Command{
	
	int totalRecord = 0; //전체 글의갯수를 가져옴
	int numPerpage = 5;//한페이지당 뿌려질 글의 갯수
	int pagePerBlock = 5; //페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
	//여기서는 3페이지를 하나로
	int totalPage = 0; //전체 몇 페이지냐
	int totalBlock = 0;
	int nowPage = 0;//현재 페이지의 위치
	int nowBlock = 0;
	int beginPerPage = 0; //페이지의 시작번호(1부터5, 6부터10...
	staff_Dao dao=new staff_Dao();
	String subsql="";
	String params = null ,id= null,date1= null,date2= null,price1= null,price2= null,num= null;
	
	private String set_sql(){
		String sql="";
		if (params != null) {

			if (!id.equals("")) {

				sql += " and member_id like '%" + id + "%'";

			}

			if (!num.equals("")) {

				sql += " and  estimate_board_num ="+num;

			}

			if (!date1.equals("") && !date2.equals("")) {

				sql += " and pre_estimate_time >= '" + date1 + "' and  pre_estimate_time <= '" + date2 + "'";

			} else if (!date1.equals("")) {

				sql += " and pre_estimate_time >= '" + date1 + "'";

			} else if (!date2.equals("")) {

				sql += " and pre_estimate_time <= '" + date2 + "'";

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

			id=req.getParameter("id");
			num=req.getParameter("num");
			date1=req.getParameter("date1");
			date2=req.getParameter("date2");
			price1=req.getParameter("price1");
			price2=req.getParameter("price2");
			params=req.getParameter("params");
			
	
		Payment_searchtext_Dto text=new Payment_searchtext_Dto(id, date1, date2, num, price1, price2);
		req.setAttribute("text", text);		
		req.setAttribute("params", params);
		

		subsql=set_sql();
		
	
		Vector<Paymentapprove_Dto> data=dao.get_PaymentApproveData(subsql);
		

		if(req.getParameter("nowPage") != null){			
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
			beginPerPage=(nowPage-1)*numPerpage;
		}
			
		
		if(req.getParameter("nowBlock") != null){
			nowBlock = Integer.parseInt(req.getParameter("nowBlock"));
		}
		
		totalRecord=data.size();
		System.out.println(beginPerPage);
		
		Vector<Paymentapprove_Dto> list=new Vector<>();
		
		for(int i=beginPerPage;i<beginPerPage+numPerpage;i++){
			
			if(i==totalRecord){
				break;
			}
			
			list.add(data.get(i));
		}
		
		
		
		totalPage = ((int)Math.ceil((double)totalRecord/numPerpage));
		
		
		totalBlock=((int)Math.ceil((double)totalPage/pagePerBlock));
		
		
		
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("nowBlock", nowBlock);
		req.setAttribute("list", list);
		req.setAttribute("list_size", list.size());
		req.setAttribute("boardpage","PAYMENT");
		req.setAttribute("beginPerPage",beginPerPage);
		req.setAttribute("totalRecord", totalRecord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalBlock", totalBlock);
		req.setAttribute("pagePerBlock", pagePerBlock);
		return "mypage/staff/payment/content/payment_approve.jsp";
	}
	
	

}
