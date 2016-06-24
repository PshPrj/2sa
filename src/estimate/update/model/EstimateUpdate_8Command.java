
/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� 8 �������� �̵�

 */
package estimate.update.model;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.EstimateDao;
import move.db.EstimateDto;
import move.db.PictureDto;

public class EstimateUpdate_8Command implements Command{


	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate_update/estimateUpdate_8.jsp");
		req.setAttribute("JsonData", req.getParameter("JsonData"));
		
		req.setAttribute("estimate_content", req.getParameter("estimate_content"));
		req.setAttribute("estimate_board_num", req.getParameter("estimate_board_num"));
		
		
		//dto�� �����Ų �� �޾ƿ���.
		EstimateDto dto = (EstimateDto) req.getAttribute("dto");
		EstimateDao dao = new EstimateDao();
		
		//���� �̸� ��������.
		ArrayList fileNameList = (ArrayList)req.getAttribute("fileNameList");
		System.out.println(fileNameList+"�����̸�");
		int estimate_board_num=dto.getEstimate_board_num();
		
		//�޾ƿ� ���� ���� ������Ʈ ��Ű��.
		dao.UpdateEstimate(dto);
		
		
		//���� �޾��� ���� ���� ����.
		PictureDto dtoPicture = new PictureDto();
		dtoPicture.setEstimate_board_num(estimate_board_num);
		dtoPicture.setMember_num(dto.getMember_num());		
		
		for(int i = 0 ; i<fileNameList.size();i++){
			dtoPicture.setImg((String)fileNameList.get(i));
			dao.insertPicture(dtoPicture);
		}
		
		
		//�����н� Ȱ���ؼ� ������ ��û�� ���� �����ϱ�.
		String picture_name = (String)req.getAttribute("picture_name");
		String[] pic_name = picture_name.split(",");
		
		String picture_list = (String)req.getAttribute("picture_list");
		String[] picture_delete = picture_list.split(",");
		
		ServletContext context = req.getSession().getServletContext();
		
		
		if(picture_name!=null){
			
			for(int i=0;i<pic_name.length;i++){
				dao.deletePicture(Integer.parseInt(picture_delete[i]));
				
				String path = context.getRealPath("upload/estimate");				
				path = path+"\\"+pic_name[i];
				
				File f= new File(path);
				f.delete();//���� ����
				
			System.out.println(picture_name);
			}
			
		}
		
		
		//�Ÿ������� ���� ������.
		req.setAttribute("distance", dto.getDistance());
		DecimalFormat f_price = new DecimalFormat("#,###");
		req.setAttribute("price", f_price.format((double)dto.getPre_price()));

		return "ESTIMATE";
	}

	
}
