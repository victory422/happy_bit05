package vs.mp.lo_001_1.controller;

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
public interface MP_001_Controller {

	ModelAndView MP_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
