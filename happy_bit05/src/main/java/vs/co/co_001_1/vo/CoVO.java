package vs.co.co_001_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
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
	private String co_b_time;
	//맴버
	private String m_id;
	private String m_name;
	private String m_gender;
	private String m_tel;
	private String m_nickname;
	//대회 일시(조인)
	private String co_b_day;
	private String co_b_count;
	
	
	
}
