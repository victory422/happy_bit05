package vs.cm.cm_001_1.vo;

import org.springframework.stereotype.Component;

@Component
public class CommentVO {

	private String com_index;
	private String co_b_index;
	private String com_text;
	private int com_good;
	private String com_writer;
	private String com_index1;
	
	public String getCom_writer() {
		return com_writer;
	}
	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}
	
	public String getCom_index() {
		return com_index;
	}
	public void setCom_index(String com_index) {
		this.com_index = com_index;
	}
	public String getCo_b_index() {
		return co_b_index;
	}
	public void setCo_b_index(String co_b_index) {
		this.co_b_index = co_b_index;
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
	public String getCom_indexl() {
		return com_index1;
	}
	public void setCom_indexl(String com_indexl) {
		this.com_index1 = com_indexl;
	}
	
	
}
