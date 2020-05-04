package vs.cr.cr_001_1.vo;

import org.springframework.stereotype.Component;

@Component
public class CrVO {

	private String co_r_index;
	private String co_r_title;
	private String co_r_text;
	private int co_r_see;
	private int co_r_good;
	private String co_r_day;
	private String co_r_type;
	private String co_b_index;
	
	//맴버
	private String m_index;
	private String m_nickname;
	
	
	
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getCo_b_index() {
		return co_b_index;
	}
	public void setCo_b_index(String co_b_index) {
		this.co_b_index = co_b_index;
	}
	public String getM_index() {
		return m_index;
	}
	public void setM_index(String m_index) {
		this.m_index = m_index;
	}
	public String getCo_r_index() {
		return co_r_index;
	}
	public void setCo_r_index(String co_r_index) {
		this.co_r_index = co_r_index;
	}
	public String getCo_r_title() {
		return co_r_title;
	}
	public void setCo_r_title(String co_r_title) {
		this.co_r_title = co_r_title;
	}
	public String getCo_r_text() {
		return co_r_text;
	}
	public void setCo_r_text(String co_r_text) {
		this.co_r_text = co_r_text;
	}
	public int getCo_r_see() {
		return co_r_see;
	}
	public void setCo_r_see(int co_r_see) {
		this.co_r_see = co_r_see;
	}
	public int getCo_r_good() {
		return co_r_good;
	}
	public void setCo_r_good(int co_r_good) {
		this.co_r_good = co_r_good;
	}
	public String getCo_r_day() {
		return co_r_day;
	}
	public void setCo_r_day(String co_r_day) {
		this.co_r_day = co_r_day;
	}
	public String getCo_r_type() {
		return co_r_type;
	}
	public void setCo_r_type(String co_r_type) {
		this.co_r_type = co_r_type;
	}
	
	
}
