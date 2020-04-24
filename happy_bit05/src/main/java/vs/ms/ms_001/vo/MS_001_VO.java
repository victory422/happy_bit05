package vs.ms.ms_001.vo;


import org.springframework.beans.factory.annotation.Autowired;

import lombok.Getter;
import lombok.ToString;
import vs.sa.sa_002.dto.Page_DTO;

@Getter
@ToString
public class MS_001_VO {

	@Autowired
	private String m_id, m_nickName, m_pw1, m_pw2, m_name, m_gender, 
	m_birth_yy, m_birth_mm, m_birth_dd, m_email_1, m_tel, m_address, m_picture;
	

	public MS_001_VO() {
		
		
	}

}