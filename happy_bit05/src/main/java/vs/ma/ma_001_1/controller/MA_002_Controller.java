package vs.ma.ma_001_1.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import vs.ma.ma_001_1.service.MA_001_1_Service;
import vs.ma.ma_001_1.vo.MA_002_1_VO;
import vs.ma.ma_001_1.vo.MA_002_2_VO;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("ma/002/*")
public class MA_002_Controller {
	
	MA_001_1_Service service;
	
	@RequestMapping("ad_get")
	public String getAdvertising(MA_002_2_VO vo, Model model) {
		
		List<MA_002_2_VO> listAd = service.listAd();
		
		for(int i = 0; i < listAd.size(); i++) {
			byte[] imageContent = Base64.getEncoder().encode(listAd.get(i).getAd_image());
			String image = new String(imageContent);
			
			listAd.get(i).setRequest_image(image);
		}
		
		model.addAttribute("listAd", listAd);
		model.addAttribute("count", listAd.size());
		
		return "MA/MA_002";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertAd(MA_002_1_VO vo) {
		
		MultipartFile[] file = vo.getAd_image();
		for(int i = 0; i < file.length; i++) {
			try {
				if(file[i] == null) {
					break;
				}else {
					Map<String, Object> hmap = new HashMap<String, Object>();
					hmap.put("ad_image", file[i].getBytes());
					service.insertAd(hmap);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		return "/al/al_001_1";
	}
}
