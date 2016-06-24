
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���� ����

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

public class EstimateUpdate_Delete_SCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
	req.setAttribute("board", "../move/estimate_update/estimateSelect_d.jsp");
	
		
		EstimateDto dto = new EstimateDto();
		EstimateDao dao = new EstimateDao();
		Vector<EstimateDto> estimates = new Vector();
		dto.setMember_num(Integer.parseInt((String)req.getParameter("member_num")));
		
		try {
			estimates = dao.getBoard(dto.getMember_num());//������� ����� ��� ���� ���� �޾ƿ���.
			req.setAttribute("estimates", estimates);
		} catch (Exception e) {
			System.out.println("estimateDeleteSelect����"+e);
		}
		return "ESTIMATE";
	}

}
