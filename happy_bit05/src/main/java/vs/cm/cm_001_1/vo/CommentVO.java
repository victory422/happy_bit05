package vs.cm.cm_001_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CommentVO {

	private String com_index;
	private String board_index;
	private String com_text;
	private int com_good;
	private String com_index1;
	private String com_dedetflag;
	private int com_count;
	private String com_date;
	//맴버
	private String m_index;
	private String m_nickname;
	
}
