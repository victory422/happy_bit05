package vs.ms.ms_001.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MS_001_VO {

	private String m_id, m_nickName, m_pw1, m_pw2, m_name, m_gender, 
	m_birth, m_email_1, m_email, m_tel, m_address, m_index, m_count,m_state;
	
	private byte[] request_thumbnail;
	
	private MultipartFile m_picture;	//썸네일 (업로드)

}
