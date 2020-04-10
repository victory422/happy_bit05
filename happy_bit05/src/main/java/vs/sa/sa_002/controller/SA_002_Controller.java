package vs.sa.sa_002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

@Controller
public interface SA_002_Controller {
	ModelAndView SA_002_4(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView P_SA_002_4(String str, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView P_SA_002_4_response(String str, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
