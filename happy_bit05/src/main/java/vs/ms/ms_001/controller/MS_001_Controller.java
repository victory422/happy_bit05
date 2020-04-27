package vs.ms.ms_001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import vs.ms.ms_001.vo.MS_001_VO;
import vs.sa.sa_002.dto.Page_DTO;

@Controller
public interface MS_001_Controller {

	ModelAndView MS_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;

//	ModelAndView MS_001_regist(MS_001_VO ms_001_vo, HttpServletRequest request, HttpServletResponse response)
//			throws Exception;

//	ModelAndView MS_001_regist(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView test(MS_001_VO ms_001_vo, HttpServletRequest request, HttpServletResponse respons) throws Exception;



}
