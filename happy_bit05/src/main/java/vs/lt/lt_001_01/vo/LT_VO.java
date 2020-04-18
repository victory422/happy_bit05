package vs.lt.lt_001_01.vo;

import lombok.Data;

@Data
public class LT_VO {
	private String lt_text;
	private String lt_category;
	private String m_index = "test_index";
	private String lt_index;
	private String lt_b_type;
	private String lt_type;
	private String lt_tier;
	private byte[] lt_thumbnail;
	private byte[] lt_picture;
	private byte[] lt_movie;
	private String lt_date;
	private String lt_title;
	private int lt_see,lt_good;	
	
}
