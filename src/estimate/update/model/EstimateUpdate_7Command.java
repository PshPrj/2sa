/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� 7 �������� �̵�

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
	
	
		//���� �������� �Ѿ �� ������Ų ���� �����Ϳ� ������ ������, ���� ��ȣ�� �ѱ��.
		req.setAttribute("JsonData", req.getParameter("JsonData"));
		req.setAttribute("estimate_content", req.getParameter("estimate_content"));
		req.setAttribute("estimate_board_num", req.getParameter("estimate_board_num"));
		
	
		//�ּ��� ���浵�� ���� �Ÿ� ����ϱ�.
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		dto.setN_lat(Double.parseDouble(req.getParameter("n_lat")));
		dto.setN_lng(Double.parseDouble(req.getParameter("n_lng")));
		dto.setL_lat(Double.parseDouble(req.getParameter("l_lat")));
		dto.setL_lng(Double.parseDouble(req.getParameter("l_lng")));
		
		double distance = dao.getDistance(dto);
		
		//15km �ʰ� �� 1km �� 3000�� �߰�.
		int distance_p = ((int) Math.round(distance)-15)*3000;
		
		if(distance_p>0){
			req.setAttribute("distance_p", distance_p);
		}
		
		//�ּҿ� �Ÿ� ����
		req.setAttribute("distance", distance);
		req.setAttribute("addr1", req.getParameter("addr1"));
		req.setAttribute("addr2", req.getParameter("addr2"));
		
		
		//���� ��ȣ ����.
		dto.setEstimate_board_num(Integer.parseInt((String)req.getParameter("estimate_board_num")));
		
		
		//������ ������ ���� ���� �޾ƿ���.
		Vector<PictureDto> picture_dto = dao.searchPicture(dto.getEstimate_board_num());
		
		
		//���� ���� �ѱ��.
		req.setAttribute("picture_dto", picture_dto);
		
		return "ESTIMATE";
	}

}
