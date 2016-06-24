package staff.db;

public class Calendar_Data {

	private String title,start,end,url;

	public Calendar_Data(String title, String start,String end,String url) {
		this.end=end;
		this.title = title;
		this.start = start;
		this.url=url;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}
	
}
