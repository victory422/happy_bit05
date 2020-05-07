package vs.al.al_001_1.vo;

import org.springframework.stereotype.Component;

@Component
public class AlVO {

	private String boardidx;
	private String title;
	private String day;
	private String see;
	private String good;
	private String memindex;
	
	public String getBoardidx() {
		return boardidx;
	}
	public void setBoardidx(String boardidx) {
		this.boardidx = boardidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getSee() {
		return see;
	}
	public void setSee(String see) {
		this.see = see;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getMemindex() {
		return memindex;
	}
	public void setMemindex(String memindex) {
		this.memindex = memindex;
	}
	
}
