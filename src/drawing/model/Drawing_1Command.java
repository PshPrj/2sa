package drawing.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import board.model.Command;
import move.db.DrawingDao;
import move.db.DrawingDto;
import move.db.UploadDao;
import move.db.UploadDto;

public class Drawing_1Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		req.setCharacterEncoding("utf-8");
		
		HttpSession session = req.getSession();
		
		ServletContext context = req.getSession().getServletContext();  //리얼패스사용
		String path = context.getRealPath("upload/drawing"); // 경로
		path = path+"\\";
		String imgBase64 = req.getParameter("imgBase64");  //1번 도면
		String imgBase64_2 = req.getParameter("imgBase64_2");	//2번 복층도면
		
		int member_num =Integer.parseInt(session.getAttribute("member_num").toString());

		String name = member_num+""; // 저장되는 이미지 이름
		String type = ".png"; // type
		
		
		File a= new File(path+member_num+"_2"+type);  // 이미지 저장시 같은 이름의 이미지 삭제.		
		a.delete();
		
		
		try {
				
			
			DbDelete(member_num);
			if (imgBase64_2.equals("")) { 
				/*
					복층이 선택되지 않았을시
					1번 도면만 upload하고
					db에 저장함
				*/

				ImgUpload(imgBase64, path, name, type);
				DbSave(member_num, name);

			} else {
				/*
					복층이 선택되었을시
					1번,2번 둘다 upload하고
					db에 저장함
				*/
				ImgUpload(imgBase64, path, name, type);
				ImgUpload(imgBase64_2, path, name + "_2", type);
				DbSave(member_num, name);
				DbSave(member_num, name + "_2");

			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		req.setAttribute("board", "../move/drawing/drawing_1.jsp");
		return "DRAWING";
	}

	private void ImgUpload(String imgBase64, String path, String name, String type) {
		// TODO Auto-generated method stub
		UploadDto updto = new UploadDto();
		UploadDao updao = new UploadDao();

		updto.setImgBase64(imgBase64);
		updto.setPath(path);
		updto.setName(name);
		updto.setType(type);
		updao.UploadDao(updto);
	}

	private void DbSave(int member_num, String name) throws Exception {
		DrawingDto drdto = new DrawingDto();
		DrawingDao drdao = new DrawingDao();

		drdto.setMember_num(member_num);
		drdto.setImg_name(name);

		drdao.insertDrawing(drdto);
	}	
	private void DbDelete(int member_num) throws Exception {
		/*
			db를 지움
		*/
		DrawingDto drdto = new DrawingDto();
		DrawingDao drdao = new DrawingDao();

		drdto.setMember_num(member_num);

		drdao.deleteDrawing(drdto);
	}
	

}
