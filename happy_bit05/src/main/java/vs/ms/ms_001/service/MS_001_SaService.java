package vs.ms.ms_001.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import vs.ms.ms_001.vo.MS_001_VO;
import vs.sa.sa_002.dto.Page_DTO;
import vs.sa.sa_002.vo.PageUtil;

public interface MS_001_SaService {

	MS_001_VO memberVO(MS_001_VO list);

	int idCheck(String m_id);

	int nickCheck(String area);

	void mailSender(String e_mail, String user_id, int key, HttpServletRequest request) throws AddressException, MessagingException;

	void registThumbnail(Map<String, Object> hmap);

}
