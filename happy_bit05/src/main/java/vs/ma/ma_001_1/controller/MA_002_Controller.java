package vs.ma.ma_001_1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.ma.ma_001_1.service.MA_001_1_Service;
import vs.ma.ma_001_1.vo.MA_002_1_VO;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("ma/002/*")
public class MA_002_Controller {

	@RequestMapping("ad_get")
	public String getAdvertising() {
			
		return "MA/MA_002";
	}
	
	@RequestMapping(value="insert")
	public String insertAd(MA_002_1_VO vo) {
		for(int i = 0; i < vo.getAd_image().length; i++) {
			System.out.println("vo 값 : " + vo.getAd_image().toString());
		}	
		
		return "MA/MA_002";
	}
}
