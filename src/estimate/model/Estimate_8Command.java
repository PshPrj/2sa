/*

 	��� : ��ȿ��
	���� ���� ���� : 6/19
	���������� ������ �����ϱ� ���� ������

 */

package estimate.model;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.ServletException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;
import move.db.PictureDto;


public class Estimate_8Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate/estimate_8.jsp");
		
		EstimateDto dto = (EstimateDto) req.getAttribute("dto");
		EstimateDao dao = new EstimateDao();
		ArrayList fileNameList = (ArrayList)req.getAttribute("fileNameList");//���� �̸� �޾ƿ���.
		int estimate_board_num=0;//���� �ʱ�ȭ.
		
		SimpleDateFormat time = new SimpleDateFormat("k",java.util.Locale.KOREA);//�̻� �ð��� int������ ����
		dto.setPre_estimate_time(Integer.parseInt(time.format(new Date())));
		
		try {
			estimate_board_num=dao.insertBoard(dto);//���� ���� �� ����� ������ ��ȣ�� �޾ƿ´�.
		} catch (Exception e) {
			System.out.println("8commandinsert"+e);
		}		
		

		PictureDto dtoPicture = new PictureDto();
		dtoPicture.setEstimate_board_num(estimate_board_num);//�޾ƿ� ��ȣ�� ���� ���忡 ���
		dtoPicture.setMember_num(dto.getMember_num());	
		
		for(int i = 0 ; i<fileNameList.size();i++){//���� ����.
			dtoPicture.setImg((String)fileNameList.get(i));
			dao.insertPicture(dtoPicture);
		}
		
		
		DecimalFormat f_price = new DecimalFormat("#,###");
		req.setAttribute("price", f_price.format((double)dto.getPre_price()));
		req.setAttribute("distance", dto.getDistance());//���� ���ݰ� ��ȣ�� �˷��ֱ� ���� ������.

		return "ESTIMATE";
	}
}
