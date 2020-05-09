package vs.lo.lo_001.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import vs.lo.lo_001.vo.LO_001_VO;
import vs.sa.sa_002.dto.Page_DTO;

@Controller
public interface LO_001_Controller {

	ModelAndView LO_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView LO_001_2(LO_001_VO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView Logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView p_LO_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
