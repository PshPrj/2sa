/*

 	��� : ��ȿ��
	���� ���� ���� : 6/17
	���� 2 �������� �̵�

 */

package estimate.model;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import board.model.Command;

public class Estimate_2Command implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setAttribute("board", "../move/estimate/estimate_2.jsp");

		req.setAttribute("JsonData", req.getParameter("JsonData"));
		//������ �����͸� ������.
		return "ESTIMATE";
	}

}
