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
import mypage.db.MyPageDao;

public class Drawing_2Command implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		
		String img_name=req.getParameter("img_name");
		
		
		ServletContext context = req.getSession().getServletContext();  //�����н����
		String path = context.getRealPath("upload/drawing"); // ���
		path = path+"\\";	
		

		
		
		File a= new File(path+img_name+".png");  // �̹��� ����� ���� �̸��� �̹��� ����.		
		a.delete();
		
		
		try {
			DbDelete(img_name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private void DbDelete(String img_name) throws Exception {
		/*
			db�� ����
		*/
		DrawingDto drdto = new DrawingDto();
		DrawingDao drdao = new DrawingDao();

		drdto.setImg_name(img_name);

		drdao.deleteDrawing2(drdto);
	}
	

}
