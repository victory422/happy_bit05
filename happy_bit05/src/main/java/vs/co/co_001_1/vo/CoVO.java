package vs.co.co_001_1.vo;

import org.springframework.stereotype.Component;

@Component
public class CoVO {
	//대회참가자
	private String co_paper_index;
	private String co_title;
	private String co_price;
	private String co_area;
	private String co_receipt;
	private String co_payday;
	private String co_state;
	private String co_m_event;
	private String co_m_souvenir;
	private String co_b_index;
	private String m_index;
	//맴버
	private String m_id;
	private String m_name;
	private String m_gender;
	private String m_tel;
	private String m_nickname;
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_index() {
		return m_index;
	}
	public void setM_index(String m_index) {
		this.m_index = m_index;
	}
	public String getCo_b_index() {
		return co_b_index;
	}
	public void setCo_b_index(String co_b_index) {
		this.co_b_index = co_b_index;
	}
	public String getCo_paper_index() {
		return co_paper_index;
	}
	public void setCo_paper_index(String co_paper_index) {
		this.co_paper_index = co_paper_index;
	}
	public String getCo_title() {
		return co_title;
	}
	public void setCo_title(String co_title) {
		this.co_title = co_title;
	}
	public String getCo_price() {
		return co_price;
	}
	public void setCo_price(String co_price) {
		this.co_price = co_price;
	}
	public String getCo_area() {
		return co_area;
	}
	public void setCo_area(String co_area) {
		this.co_area = co_area;
	}
	public String getCo_receipt() {
		return co_receipt;
	}
	public void setCo_receipt(String co_receipt) {
		this.co_receipt = co_receipt;
	}
	public String getCo_payday() {
		return co_payday;
	}
	public void setCo_payday(String co_payday) {
		this.co_payday = co_payday;
	}
	public String getCo_state() {
		return co_state;
	}
	public void setCo_state(String co_state) {
		this.co_state = co_state;
	}
	public String getCo_m_event() {
		return co_m_event;
	}
	public void setCo_m_event(String co_event) {
		this.co_m_event = co_event;
	}
	public String getCo_m_souvenir() {
		return co_m_souvenir;
	}
	public void setCo_m_souvenir(String co_souvenir) {
		this.co_m_souvenir = co_souvenir;
	}
	
	
}
