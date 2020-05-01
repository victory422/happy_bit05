package vs.lo.lo_001.vo;


import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class LO_001_VO {

	private String m_id, m_pw, loginMsg, m_nickName, m_name, m_gender, 
	m_birth, m_email_1, m_tel, m_address, m_picture, m_index, m_state;
	private int loginCheck, m_count, m_point;
	
	
}