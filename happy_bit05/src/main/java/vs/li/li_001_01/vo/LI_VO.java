package vs.li.li_001_01.vo;



import lombok.Data;


@Data
public class LI_VO {
	private String li_text;
	private String li_category;
	private String m_index = "test_index";
	private String li_index;
	private String li_b_type;
	private String li_type;
	private byte[] li_thumbnail;
	private byte[] li_picture;
	private String li_date;
	private String li_title;
	private int li_see,li_good;	
	
}
