package vs.mb.mb_001_1.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Component
public class PR_VO {
	private String pr_index;
	private String mp_index;
	private String m_index;
	private String pr_title;
	private String pr_text;
	private int pr_see;
	private int pr_good;
	private String pr_resistdate;
	private String pr_recorddate;
	private String pr_record;
	private MultipartFile pr_thumbnail; //썸네일 업로드.
	private String pr_type;
	private String pr_public;
	
	//다른 테이블의 변수들.
	private String lc_index;
	private String lc_title;
}
