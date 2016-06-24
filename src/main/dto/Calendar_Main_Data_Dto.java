package main.dto;

public class Calendar_Main_Data_Dto {
	
	private String title,start;

	public Calendar_Main_Data_Dto(String title, String start) {
		this.title=title;
		this.start=start;
	}

	public Calendar_Main_Data_Dto(){}
	
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
