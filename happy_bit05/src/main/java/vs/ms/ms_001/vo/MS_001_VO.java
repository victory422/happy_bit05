package vs.ms.ms_001.vo;


import lombok.Data;

@Data
public class MS_001_VO {

	private String m_id, m_nickName, m_pw1, m_pw2, m_name, m_gender, 
	m_birth, m_email_1, m_tel, m_address, m_picture;

	
	public MS_001_VO() {
		this.m_picture = "";
		
	}
}
