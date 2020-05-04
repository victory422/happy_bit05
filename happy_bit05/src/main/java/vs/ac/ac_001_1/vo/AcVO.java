package vs.ac.ac_001_1.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
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
	
	public String getCo_b_count() {
		return co_b_count;
	}
	public void setCo_b_count(String co_b_count) {
		this.co_b_count = co_b_count;
	}
	public String getCo_b_state() {
		return co_b_state;
	}
	public void setCo_b_state(String co_b_state) {
		this.co_b_state = co_b_state;
	}
	public String getCo_b_start() {
		return co_b_start;
	}
	public void setCo_b_start(String co_b_start) {
		this.co_b_start = co_b_start;
	}
	public String getCo_b_end() {
		return co_b_end;
	}
	public void setCo_b_end(String co_b_end) {
		this.co_b_end = co_b_end;
	}
	public byte[] getCo_thumbnail() {
		return co_thumbnail;
	}
	public void setCo_thumbnail(byte[] co_thumbnail) {
		this.co_thumbnail = co_thumbnail;
	}
	public String getCo_request() {
		return co_request;
	}
	public void setCo_request(String co_request) {
		this.co_request = co_request;
	}
	public MultipartFile getCo_b_thumbnail() {
		return co_b_thumbnail;
	}
	public void setCo_b_thumbnail(MultipartFile co_b_thumbnail) {
		this.co_b_thumbnail = co_b_thumbnail;
	}
	
	public String getCo_rating() {
		return co_rating;
	}
	public void setCo_rating(String co_rating) {
		this.co_rating = co_rating;
	}
	public String getCo_souvenir() {
		return co_souvenir;
	}
	public void setCo_souvenir(String co_souvenir) {
		this.co_souvenir = co_souvenir;
	}
	
	public String getCo_b_price() {
		return co_b_price;
	}
	public void setCo_b_price(String co_b_price) {
		this.co_b_price = co_b_price;
	}
	public int getCo_b_see() {
		return co_b_see;
	}
	public void setCo_b_see(int co_b_see) {
		this.co_b_see = co_b_see;
	}
	public int getCo_b_good() {
		return co_b_good;
	}
	public void setCo_b_good(int co_b_good) {
		this.co_b_good = co_b_good;
	}
	public String getCo_b_date() {
		return co_b_date;
	}
	public void setCo_b_date(String co_b_date) {
		this.co_b_date = co_b_date;
	}
	public String getCo_b_area() {
		return co_b_area;
	}
	public void setCo_b_area(String co_b_area) {
		this.co_b_area = co_b_area;
	}
	public String getCo_b_type() {
		return co_b_type;
	}
	public void setCo_b_type(String co_b_type) {
		this.co_b_type = co_b_type;
	}

	public String getCo_b_index() {
		return co_b_index;
	}
	public void setCo_b_index(String co_b_index) {
		this.co_b_index = co_b_index;
	}
	public String getCo_b_text() {
		return co_b_text;
	}
	public void setCo_b_text(String co_b_text) {
		this.co_b_text = co_b_text;
	}
	public String getCo_b_title() {
		return co_b_title;
	}
	public void setCo_b_title(String co_b_title) {
		this.co_b_title = co_b_title;
	}

	public String getCo_b_day() {
		return co_b_day;
	}
	public void setCo_b_day(String co_b_day) {
		this.co_b_day = co_b_day;
	}

	
}
