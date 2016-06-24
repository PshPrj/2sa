package staff.db;

public class Stastisticsclient_Dto {
	
	private String m_name,m_id,num;
	private String regi_date;
	private int move_cnt;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(String regi_date) {
		this.regi_date = regi_date;
	}
	public int getMove_cnt() {
		return move_cnt;
	}
	public void setMove_cnt(int move_cnt) {
		this.move_cnt = move_cnt;
	}
	

}
