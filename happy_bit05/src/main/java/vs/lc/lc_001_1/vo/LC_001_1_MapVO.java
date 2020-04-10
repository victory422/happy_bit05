package vs.lc.lc_001_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class LC_001_1_MapVO {

	private String lc_index;
	private String lc_address;	//출발지 상세
	private String lc_xy_arr;	//좌표
}
