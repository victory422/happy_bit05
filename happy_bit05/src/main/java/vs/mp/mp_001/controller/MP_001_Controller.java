package vs.mp.mp_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import vs.mp.mp_001.dto.Page_DTO;


@Controller
public interface MP_001_Controller {

	ModelAndView MP_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView MP_001_3(int pageNum, Page_DTO dto, HttpServletRequest request, HttpServletResponse response)
			throws Exception;


}
