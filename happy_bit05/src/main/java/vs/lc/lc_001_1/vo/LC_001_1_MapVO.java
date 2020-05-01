package vs.lc.lc_001_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class LC_001_1_MapVO {

	private String lc_index;
	private String lc_address;	//출발지 상세
	private String lc_xy_arr;	//좌표
	
	public LC_001_1_MapVO() {
		super();
	}

	public LC_001_1_MapVO(String lc_index, String lc_address, String lc_xy_arr) {
		super();
		this.lc_index = lc_index;
		this.lc_address = lc_address;
		this.lc_xy_arr = lc_xy_arr;
	}

	public String getLc_index() {
		return lc_index;
	}

	public void setLc_index(String lc_index) {
		this.lc_index = lc_index;
	}

	public String getLc_address() {
		return lc_address;
	}

	public void setLc_address(String lc_address) {
		this.lc_address = lc_address;
	}

	public String getLc_xy_arr() {
		return lc_xy_arr;
	}

	public void setLc_xy_arr(String lc_xy_arr) {
		this.lc_xy_arr = lc_xy_arr;
	}

	@Override
	public String toString() {
		return "LC_001_1_MapVO [lc_index=" + lc_index + ", lc_address=" + lc_address + ", lc_xy_arr=" + lc_xy_arr + "]";
	}
	
	
}
