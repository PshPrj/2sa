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
		
		ServletContext context = req.getSession().getServletContext();  //�����н����
		String path = context.getRealPath("upload/drawing"); // ���
		path = path+"\\";
		String imgBase64 = req.getParameter("imgBase64");  //1�� ����
		String imgBase64_2 = req.getParameter("imgBase64_2");	//2�� ��������
		
		int member_num =Integer.parseInt(session.getAttribute("member_num").toString());

		String name = member_num+""; // ����Ǵ� �̹��� �̸�
		String type = ".png"; // type
		
		
		File a= new File(path+member_num+"_2"+type);  // �̹��� ����� ���� �̸��� �̹��� ����.		
		a.delete();
		
		
		try {
				
			
			DbDelete(member_num);
			if (imgBase64_2.equals("")) { 
				/*
					������ ���õ��� �ʾ�����
					1�� ���鸸 upload�ϰ�
					db�� ������
				*/

				ImgUpload(imgBase64, path, name, type);
				DbSave(member_num, name);

			} else {
				/*
					������ ���õǾ�����
					1��,2�� �Ѵ� upload�ϰ�
					db�� ������
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
			db�� ����
		*/
		DrawingDto drdto = new DrawingDto();
		DrawingDao drdao = new DrawingDao();

		drdto.setMember_num(member_num);

		drdao.deleteDrawing(drdto);
	}
	

}
