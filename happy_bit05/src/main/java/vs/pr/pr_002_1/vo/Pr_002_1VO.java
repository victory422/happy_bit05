package vs.pr.pr_002_1.vo;

import org.springframework.stereotype.Component;

@Component
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
		//맴버 조인
		private String m_index;
		private String m_nickname;
		
		public String getM_nickname() {
			return m_nickname;
		}
		public void setM_nickname(String m_nickname) {
			this.m_nickname = m_nickname;
		}
		public String getM_index() {
			return m_index;
		}
		public void setM_index(String m_index) {
			this.m_index = m_index;
		}
		public String getPr_index() {
			return pr_index;
		}
		public void setPr_index(String pr_index) {
			this.pr_index = pr_index;
		}
		public String getMp_index() {
			return mp_index;
		}
		public void setMp_index(String mp_index) {
			this.mp_index = mp_index;
		}
		public String getPr_title() {
			return pr_title;
		}
		public void setPr_title(String pr_title) {
			this.pr_title = pr_title;
		}
		public String getPr_text() {
			return pr_text;
		}
		public void setPr_text(String pr_text) {
			this.pr_text = pr_text;
		}
		public String getPr_see() {
			return pr_see;
		}
		public void setPr_see(String pr_see) {
			this.pr_see = pr_see;
		}
		public String getPr_good() {
			return pr_good;
		}
		public void setPr_good(String pr_good) {
			this.pr_good = pr_good;
		}
		public String getPr_resistDate() {
			return pr_resistDate;
		}
		public void setPr_resistDate(String pr_resistDate) {
			this.pr_resistDate = pr_resistDate;
		}
		public String getPr_recordDate() {
			return pr_recordDate;
		}
		public void setPr_recordDate(String pr_recordDate) {
			this.pr_recordDate = pr_recordDate;
		}
		public String getPr_record() {
			return pr_record;
		}
		public void setPr_record(String pr_record) {
			this.pr_record = pr_record;
		}
		public String getPr_type() {
			return pr_type;
		}
		public void setPr_type(String pr_type) {
			this.pr_type = pr_type;
		}
		public String getPr_public() {
			return pr_public;
		}
		public void setPr_public(String pr_public) {
			this.pr_public = pr_public;
		}
		
		
		
	}


