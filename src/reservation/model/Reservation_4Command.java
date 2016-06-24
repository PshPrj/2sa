/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���� ��� Command

 */

package reservation.model;

import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import move.db.ReservationDao;
import move.db.ReservationDto;

public class Reservation_4Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/reservation/reservation_4.jsp");
		int price = 0;
		String keep_date=req.getParameter("keep_date");//�� ���� ��¥
		String move_date=req.getParameter("move_date");//�̻� ��¥
		Date date = new Date();
		Date keep = new Date();
		Date move = new Date();
		
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");//��¥ ���� ���
		date = new Date();
		try {
			date = df.parse(move_date);//�̻糯¥ �Ľ�.
		} catch (ParseException e) {
			System.out.println("�ָ� ��� ����");
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);//�̻糯¥ ����
		int day = calendar.get(Calendar.DAY_OF_WEEK);//�̻� ��¥�� �ָ����� �ƴ��� Ȯ��.
		
		if(day==3 || day==4){
			price=price+20000;//�ָ��� ��� �߰���� 2���� �߻�.
		}
		
		try {
			keep = df.parse(keep_date);//�� ���� ��¥
			move = df.parse(move_date);//�̻� ��¥
		} catch (ParseException e) {
			System.out.println("�ϼ� ����");
		}
		
		long diff = move.getTime()-keep.getTime();
		int days = (int) (diff / (24*60*60*1000));//��ĥ �����ϴ��� Ȯ��(�̻糯¥ - ������¥)
		
		price = (int) (price + 5000*days);//�Ϸ� ������ �� ���� ��õ�� �߰� �ݾ� �߻�.		
		
		
		ReservationDto dto = new ReservationDto();
		ReservationDao dao = new ReservationDao();
		
		
		//������ ���� ��ȣ �޾ƿ���.
		dto.setEstimate_board_num(Integer.parseInt(req.getParameter("estimate_board_num")));
		dto.setReservation_date(move_date);//���� ��¥(�̻糯¥) �ֱ�.
		if(keep_date!=null){//������ ��û�� ���
			dto.setKeep_item_date(days);
		}else{
			dto.setKeep_item_date(0);//������ ��û���� ���� ���. ���� ��¥�� 0��.
		}
		if(req.getParameter("template")!=""){//��ġ���� ������ ���.
			dto.setTemplate(Boolean.parseBoolean((String)req.getParameter("template")));
		}

		price=(int)((price+dao.searchPrice(dto))*1.1);//10% �ΰ���
		
		dto.setPrice(price);//���� ���.
		
		dto.setReservation_time(Integer.parseInt(req.getParameter("reservation_time")));
		dto.setMember_num(Integer.parseInt((String)req.getParameter("member_num")));
		
		dao.insertReservation(dto);//���� ���.
		
		DecimalFormat f_price = new DecimalFormat("#,###");
		req.setAttribute("price", f_price.format((double)price));//���ڸ� ���� , ��� ������.
		req.setAttribute("reservation_date", move_date);//������ == �̻糯¥

		return "RESERVATION";
	}

}
