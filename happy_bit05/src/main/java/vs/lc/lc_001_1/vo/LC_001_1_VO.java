package vs.lc.lc_001_1.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component

public class LC_001_1_VO {

	private String lc_index;	//게시글 번호
	private String m_index;		//멤버 번호
	private String lc_title;	//게시글 제목
	private String lc_type;		//코스 유형
	private String lc_distance;	//거리
	private String lc_run;		//도보 시간
	private String lc_cycle;	//자전거 시간
	private String lc_area1;	//지역1 (시)
	private String lc_area2;	//지역2 (구)
	private String lc_area3;	//지역3 (동)
	private MultipartFile lc_thumbnail;	//썸네일
	private String lc_text;		//내용
	private String lc_date;		//작성날짜
	private int lc_good;		//좋아요
	private int lc_see;			//조회수
	private String lc_record;	//평균 기록
	
	public LC_001_1_VO() {
		super();
	}

	public LC_001_1_VO(String lc_index, String m_index, String lc_title, String lc_type, String lc_distance,
			String lc_run, String lc_cycle, String lc_area1, String lc_area2, String lc_area3,
			MultipartFile lc_thumbnail, String lc_text, String lc_date, int lc_good, int lc_see, String lc_record) {
		super();
		this.lc_index = lc_index;
		this.m_index = m_index;
		this.lc_title = lc_title;
		this.lc_type = lc_type;
		this.lc_distance = lc_distance;
		this.lc_run = lc_run;
		this.lc_cycle = lc_cycle;
		this.lc_area1 = lc_area1;
		this.lc_area2 = lc_area2;
		this.lc_area3 = lc_area3;
		this.lc_thumbnail = lc_thumbnail;
		this.lc_text = lc_text;
		this.lc_date = lc_date;
		this.lc_good = lc_good;
		this.lc_see = lc_see;
		this.lc_record = lc_record;
	}

	public String getLc_index() {
		return lc_index;
	}

	public void setLc_index(String lc_index) {
		this.lc_index = lc_index;
	}

	public String getM_index() {
		return m_index;
	}

	public void setM_index(String m_index) {
		this.m_index = m_index;
	}

	public String getLc_title() {
		return lc_title;
	}

	public void setLc_title(String lc_title) {
		this.lc_title = lc_title;
	}

	public String getLc_type() {
		return lc_type;
	}

	public void setLc_type(String lc_type) {
		this.lc_type = lc_type;
	}

	public String getLc_distance() {
		return lc_distance;
	}

	public void setLc_distance(String lc_distance) {
		this.lc_distance = lc_distance;
	}

	public String getLc_run() {
		return lc_run;
	}

	public void setLc_run(String lc_run) {
		this.lc_run = lc_run;
	}

	public String getLc_cycle() {
		return lc_cycle;
	}

	public void setLc_cycle(String lc_cycle) {
		this.lc_cycle = lc_cycle;
	}

	public String getLc_area1() {
		return lc_area1;
	}

	public void setLc_area1(String lc_area1) {
		this.lc_area1 = lc_area1;
	}

	public String getLc_area2() {
		return lc_area2;
	}

	public void setLc_area2(String lc_area2) {
		this.lc_area2 = lc_area2;
	}

	public String getLc_area3() {
		return lc_area3;
	}

	public void setLc_area3(String lc_area3) {
		this.lc_area3 = lc_area3;
	}

	public MultipartFile getLc_thumbnail() {
		return lc_thumbnail;
	}

	public void setLc_thumbnail(MultipartFile lc_thumbnail) {
		this.lc_thumbnail = lc_thumbnail;
	}

	public String getLc_text() {
		return lc_text;
	}

	public void setLc_text(String lc_text) {
		this.lc_text = lc_text;
	}

	public String getLc_date() {
		return lc_date;
	}

	public void setLc_date(String lc_date) {
		this.lc_date = lc_date;
	}

	public int getLc_good() {
		return lc_good;
	}

	public void setLc_good(int lc_good) {
		this.lc_good = lc_good;
	}

	public int getLc_see() {
		return lc_see;
	}

	public void setLc_see(int lc_see) {
		this.lc_see = lc_see;
	}

	public String getLc_record() {
		return lc_record;
	}

	public void setLc_record(String lc_record) {
		this.lc_record = lc_record;
	}

	@Override
	public String toString() {
		return "LC_001_1_VO [lc_index=" + lc_index + ", m_index=" + m_index + ", lc_title=" + lc_title + ", lc_type="
				+ lc_type + ", lc_distance=" + lc_distance + ", lc_run=" + lc_run + ", lc_cycle=" + lc_cycle
				+ ", lc_area1=" + lc_area1 + ", lc_area2=" + lc_area2 + ", lc_area3=" + lc_area3 + ", lc_thumbnail="
				+ lc_thumbnail + ", lc_text=" + lc_text + ", lc_date=" + lc_date + ", lc_good=" + lc_good + ", lc_see="
				+ lc_see + ", lc_record=" + lc_record + "]";
	}
	
	
	
}
