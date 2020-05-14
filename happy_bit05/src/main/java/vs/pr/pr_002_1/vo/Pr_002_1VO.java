package vs.pr.pr_002_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Pr_002_1VO {

		private String pr_index;
		private String mp_index;
		private String pr_title;
		private String pr_text;
		private String pr_see;
		private String pr_good;
		private String pr_resistDate;
		private String pr_recordDate;
		private String pr_record;
		private String pr_type;
		private String pr_public;
		//섬네일
		private byte[] pr_thumbnail1;
		private String request_thumbnail;
		
		//맴버 조인
		private String m_index;
		private String m_nickname;
		
		//코스조인
		private String lc_index;
		private String lc_title;
		private String lc_type;
		private String lc_distance;
		private String lc_run;
		private String lc_cycle;
		private String lc_area1;
		private String lc_area2;
		private String lc_area3;
		private String lc_text;
		private String lc_date;
		private String lc_good;
		private String lc_see;
		private String lc_record;
		
		//맵조인
		private String lc_xy_arr;
		private String lc_address;
		
	}


