package register.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

public interface command {
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException;
}
