package vs.sp.sp_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;


@Controller
public interface SP_001_Controller {

	public ModelAndView SP_001(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws Exception;

	}
