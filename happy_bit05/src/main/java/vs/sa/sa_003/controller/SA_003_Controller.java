package vs.sa.sa_003.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public interface SA_003_Controller {
	
	ModelAndView SA_003_1(Map<String, String> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	ModelAndView SA_003(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView newProdId(String prod_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView upload(MultipartHttpServletRequest mtf, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
