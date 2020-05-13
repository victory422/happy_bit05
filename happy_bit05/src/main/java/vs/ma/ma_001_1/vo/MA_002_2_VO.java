package vs.ma.ma_001_1.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MA_002_2_VO {

	//리퀘스트용.
	private String ad_index;
	private byte[] ad_image;
	private String ad_date;
	
	//사진 뿌려주기
	private String request_image;
}
