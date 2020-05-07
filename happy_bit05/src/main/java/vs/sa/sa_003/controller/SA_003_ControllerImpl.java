package vs.sa.sa_003.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import vs.sa.sa_003.service.SA_003_SaService;

@Controller
public class SA_003_ControllerImpl implements SA_003_Controller {

	@Autowired
	SA_003_SaService saService;

	@Override
	@RequestMapping(value = "/sa/new")
	public ModelAndView SA_003(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("/sa mapping");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sa/sa_003_1");
		return mav;
	}

	@Override
	@RequestMapping(value = "/sa/new/prod_id={prod_id}")
	public ModelAndView newProdId(@PathVariable("prod_id") String prod_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("/sa mapping");
		System.out.println(prod_id);
		request.setAttribute("prod_id", prod_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sa/sa_003_1");
		return mav;
	}

	@Override
	@RequestMapping(value = "/sa/new/regist")
	public ModelAndView SA_003_1(@RequestParam Map<String, String> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("/sa/regist mapping");
		String[] codeList = request.getParameterValues("sale_code_sub");
		System.out.println(codeList);
		for (int i = 0; i < codeList.length; i++) {
			map.replace("sale_code_sub", codeList[i]);
			saService.saleInsert(map);
			System.out.println("check!" + map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/sp/sp_001_1");
		System.out.println("mav완료");

		return mav;
	}

	private void makeThumbnail(String filePath, String fileName, String fileExt) throws Exception {
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		BufferedImage srcImg = ImageIO.read(new File(filePath));
		// 썸네일의 너비와 높이 입니다.
		int dw = 250, dh = 150;
		// 원본 이미지의 너비와 높이 입니다.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
		int nw = ow;
		int nh = (ow * dh) / dw;
		// 계산된 높이가 원본보다 높다면 crop이 안되므로
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
		if (nh > oh) {
			nw = (oh * dw) / dh;
			nh = oh;
		}
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
		BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);
		// crop된 이미지로 썸네일을 생성합니다.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		// 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
		String thumbName = "C:/jg_last/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/happy_bit05/resources/ckstorage" + "THUMB_" + fileName;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
	}

	
	@Override
	@RequestMapping(value = "/sa/new/upload" , method = RequestMethod.POST)
	public ModelAndView upload(MultipartHttpServletRequest mtf,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("chch");
		// 파일 태그
		String fileTag = "file";
	    	// 업로드 파일이 저장될 경로
		String filePath = "C:/jg_last/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/happy_bit05/resources/ckstorage";
		// 파일 이름	
		MultipartFile file = mtf.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		// 파일 전송
		try {
		    file.transferTo(new File(filePath + fileName));
		} catch(Exception e) {
		    System.out.println("업로드 오류");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sa/sa_003_1");
		System.out.println("mav완료");

		return mav;
			         
	}

}


