/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적 7 페이지로 이동

 */


package estimate.update.model;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;
import move.db.PictureDto;

public class EstimateUpdate_7Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	req.setAttribute("board", "../move/estimate_update/estimateUpdate_7.jsp");
	
	
		//다음 페이지롤 넘어갈 때 축적시킨 변경 데이터와 기존의 데이터, 견적 번호를 넘긴다.
		req.setAttribute("JsonData", req.getParameter("JsonData"));
		req.setAttribute("estimate_content", req.getParameter("estimate_content"));
		req.setAttribute("estimate_board_num", req.getParameter("estimate_board_num"));
		
	
		//주소의 위경도를 통해 거리 계산하기.
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		dto.setN_lat(Double.parseDouble(req.getParameter("n_lat")));
		dto.setN_lng(Double.parseDouble(req.getParameter("n_lng")));
		dto.setL_lat(Double.parseDouble(req.getParameter("l_lat")));
		dto.setL_lng(Double.parseDouble(req.getParameter("l_lng")));
		
		double distance = dao.getDistance(dto);
		
		//15km 초과 시 1km 당 3000원 추가.
		int distance_p = ((int) Math.round(distance)-15)*3000;
		
		if(distance_p>0){
			req.setAttribute("distance_p", distance_p);
		}
		
		//주소와 거리 저장
		req.setAttribute("distance", distance);
		req.setAttribute("addr1", req.getParameter("addr1"));
		req.setAttribute("addr2", req.getParameter("addr2"));
		
		
		//견적 번호 저장.
		dto.setEstimate_board_num(Integer.parseInt((String)req.getParameter("estimate_board_num")));
		
		
		//기존에 저장한 사진 정보 받아오기.
		Vector<PictureDto> picture_dto = dao.searchPicture(dto.getEstimate_board_num());
		
		
		//사진 정보 넘기기.
		req.setAttribute("picture_dto", picture_dto);
		
		return "ESTIMATE";
	}

}
