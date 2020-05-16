package vs.ac.ac_001_1.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data
public class AcVO {

	private String co_b_index;
	private String co_b_title;
	private String co_b_text;
	private String co_b_day;
	private int co_b_see;
	private int co_b_good;
	private String co_b_date;
	private String co_b_area;
	private String co_b_start;
	private String co_b_state;
	private String co_b_count;
	private String co_b_end;
	private String co_b_type;
	private String co_b_price;
	private String co_souvenir;
	private String co_rating;
	private MultipartFile co_b_thumbnail;
	private byte[] co_thumbnail;
	private String co_request;
	private String co_b_time;
	//회원 조인
	private String m_index;
	private String m_nickname;
	
	
}
