package vs.ma.ma_001_1.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartRequest;

import lombok.Data;

@Component
@Data
public class MA_002_1_VO {

	//업로드용.
	private MultipartRequest ad_image[];
}
