package staff.model;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import mypage.model.Command;
import staff.db.staff_Dao;

public class Refund_Modal_Command implements Command {

	staff_Dao dao=new staff_Dao();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		String pay_num=req.getParameter("pay_num");
		String member_num=req.getParameter("member_num");
		
		if(req.getParameter("type")!=null)
		{
			dao.Update_Refund(pay_num,member_num);
		}else{
			String date = req.getParameter("date");
			int dist_to_date=get_dist_to_date(date);
			int price=Integer.valueOf(req.getParameter("price"));
			int re_price=price;
			int percent=0;
			if(dist_to_date>=10){
				percent=80;
				re_price*=0.8;
			}else if(dist_to_date<10&&dist_to_date>=5){
				percent=50;
				re_price*=0.5;
			}else if(dist_to_date<5&&dist_to_date>=3){
				percent=30;
				re_price*=0.3;
			}else if(dist_to_date<3&&dist_to_date>=0){
				percent=10;
				re_price*=0.1;
			}else if(dist_to_date<0){
				percent=0;
				re_price*=0;
			}
			req.setAttribute("re_price", re_price);
			req.setAttribute("percent", percent);
			req.setAttribute("date", date);
			req.setAttribute("dist", dist_to_date);
			req.setAttribute("id", req.getParameter("id"));
			req.setAttribute("price", price);
		}
		
		
	
		req.setAttribute("pay_num", req.getParameter("pay_num"));
		return "/mypage/staff/payment/modal/refund_confirm_modal.jsp";
	}

	public int get_dist_to_date(String date) {
		
		int dist=0;

		try {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date res_date = transFormat.parse(date);
			String day =transFormat.format(new Date());
			Date today=transFormat.parse(day);
			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();

			cal2.setTime(today);
			cal1.setTime(res_date);
			
			dist=cal1.compareTo(cal2);
			
			
			System.out.println(cal1.getTime()+"  "+cal2.getTime());
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dist;
		
	}

}
