/*

 	담당 : 정효진
	최종 수정 일자 : 6/15
	견적 7 페이지로 이동

 */
package estimate.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;

public class Estimate_7Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate/estimate_7.jsp");
		
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		
		//위 경도를 활용해 거리 구하기.
		dto.setN_lat(Double.parseDouble(req.getParameter("n_lat")));
		dto.setN_lng(Double.parseDouble(req.getParameter("n_lng")));
		dto.setL_lat(Double.parseDouble(req.getParameter("l_lat")));
		dto.setL_lng(Double.parseDouble(req.getParameter("l_lng")));
		
		double distance = dao.getDistance(dto);
		
		int distance_p = ((int) Math.round(distance)-15)*3000;//1km 당 3000원 추가 요금 발생.
		
		if(distance_p>0){
			req.setAttribute("distance_p", distance_p);
		}
		
		req.setAttribute("distance", distance);
		req.setAttribute("addr1", req.getParameter("addr1"));
		req.setAttribute("addr2", req.getParameter("addr2"));
		
		return "ESTIMATE";
	}

}
