/*

 	담당 : 정효진
	최종 수정 일자 : 6/19
	최종적으로 견적을 저장하기 위한 페이지

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
		ArrayList fileNameList = (ArrayList)req.getAttribute("fileNameList");//사진 이름 받아오기.
		int estimate_board_num=0;//변수 초기화.
		
		SimpleDateFormat time = new SimpleDateFormat("k",java.util.Locale.KOREA);//이사 시간을 int형으로 저장
		dto.setPre_estimate_time(Integer.parseInt(time.format(new Date())));
		
		try {
			estimate_board_num=dao.insertBoard(dto);//견적 저장 및 저장된 견적의 번호를 받아온다.
		} catch (Exception e) {
			System.out.println("8commandinsert"+e);
		}		
		

		PictureDto dtoPicture = new PictureDto();
		dtoPicture.setEstimate_board_num(estimate_board_num);//받아온 번호를 사진 저장에 사용
		dtoPicture.setMember_num(dto.getMember_num());	
		
		for(int i = 0 ; i<fileNameList.size();i++){//사진 저장.
			dtoPicture.setImg((String)fileNameList.get(i));
			dao.insertPicture(dtoPicture);
		}
		
		
		DecimalFormat f_price = new DecimalFormat("#,###");
		req.setAttribute("price", f_price.format((double)dto.getPre_price()));
		req.setAttribute("distance", dto.getDistance());//사진 가격과 번호를 알려주기 위해 보낸다.

		return "ESTIMATE";
	}
}
