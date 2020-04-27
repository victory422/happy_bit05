package vs.cm.cm_001_1.vo;

import org.springframework.stereotype.Component;

@Component
public class CommentVO {

	private String com_index;
	private String board_index;
	private String com_text;
	private int com_good;
	private String com_writer;
	private String com_index1;
	private String com_dedetflag;
	
	
	public String getCom_index1() {
		return com_index1;
	}
	public void setCom_index1(String com_index1) {
		this.com_index1 = com_index1;
	}
	public String getCom_index() {
		return com_index;
	}
	public void setCom_index(String com_index) {
		this.com_index = com_index;
	}
	public String getBoard_index() {
		return board_index;
	}
	public void setBoard_index(String board_index) {
		this.board_index = board_index;
	}
	public String getCom_text() {
		return com_text;
	}
	public void setCom_text(String com_text) {
		this.com_text = com_text;
	}
	public int getCom_good() {
		return com_good;
	}
	public void setCom_good(int com_good) {
		this.com_good = com_good;
	}
	public String getCom_writer() {
		return com_writer;
	}
	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}
	public String getCom_dedetflag() {
		return com_dedetflag;
	}
	public void setCom_dedetflag(String com_dedetflag) {
		this.com_dedetflag = com_dedetflag;
	}

	
	
}
