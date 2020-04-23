package vs.sa.sa_002.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import vs.sa.sa_002.dto.Page_DTO;

@Controller
public interface SA_002_Controller {
	ModelAndView P_SA_002_4_response(String str, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
//	ModelAndView SaproductsPaging(int pageNum, HttpServletRequest request, HttpServletResponse response)
//			throws Exception;
	ModelAndView P_SA_002_4(String str, int pageNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	ModelAndView SaproductsPaging(int pageNum, Page_DTO pagedto, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
