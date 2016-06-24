/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	예약 등록 Command

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
		String keep_date=req.getParameter("keep_date");//짐 보관 날짜
		String move_date=req.getParameter("move_date");//이사 날짜
		Date date = new Date();
		Date keep = new Date();
		Date move = new Date();
		
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");//날짜 형식 등록
		date = new Date();
		try {
			date = df.parse(move_date);//이사날짜 파싱.
		} catch (ParseException e) {
			System.out.println("주말 계산 오류");
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);//이사날짜 설정
		int day = calendar.get(Calendar.DAY_OF_WEEK);//이사 날짜가 주말인지 아닌지 확인.
		
		if(day==3 || day==4){
			price=price+20000;//주말인 경우 추가요금 2만원 발생.
		}
		
		try {
			keep = df.parse(keep_date);//짐 보관 날짜
			move = df.parse(move_date);//이사 날짜
		} catch (ParseException e) {
			System.out.println("일수 오류");
		}
		
		long diff = move.getTime()-keep.getTime();
		int days = (int) (diff / (24*60*60*1000));//며칠 보관하는지 확인(이사날짜 - 보관날짜)
		
		price = (int) (price + 5000*days);//하루 보관할 때 마다 오천원 추가 금액 발생.		
		
		
		ReservationDto dto = new ReservationDto();
		ReservationDao dao = new ReservationDao();
		
		
		//선택한 견적 번호 받아오기.
		dto.setEstimate_board_num(Integer.parseInt(req.getParameter("estimate_board_num")));
		dto.setReservation_date(move_date);//예약 날짜(이사날짜) 넣기.
		if(keep_date!=null){//보관을 신청한 경우
			dto.setKeep_item_date(days);
		}else{
			dto.setKeep_item_date(0);//보관을 신청하지 않은 경우. 보관 날짜가 0일.
		}
		if(req.getParameter("template")!=""){//배치도를 선택한 경우.
			dto.setTemplate(Boolean.parseBoolean((String)req.getParameter("template")));
		}

		price=(int)((price+dao.searchPrice(dto))*1.1);//10% 부가세
		
		dto.setPrice(price);//가격 등록.
		
		dto.setReservation_time(Integer.parseInt(req.getParameter("reservation_time")));
		dto.setMember_num(Integer.parseInt((String)req.getParameter("member_num")));
		
		dao.insertReservation(dto);//예약 등록.
		
		DecimalFormat f_price = new DecimalFormat("#,###");
		req.setAttribute("price", f_price.format((double)price));//세자리 마다 , 찍어 보내기.
		req.setAttribute("reservation_date", move_date);//예약일 == 이사날짜

		return "RESERVATION";
	}

}
