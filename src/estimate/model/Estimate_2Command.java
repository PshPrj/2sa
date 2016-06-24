/*

 	담당 : 정효진
	최종 수정 일자 : 6/17
	견적 2 페이지로 이동

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
		//축적된 데이터를 보낸다.
		return "ESTIMATE";
	}

}
