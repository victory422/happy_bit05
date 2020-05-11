package vs.mp.mp_001.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.ibleaders.utility.ib_json.JSONObject;

import vs.lo.lo_001.vo.LO_001_VO;
import vs.mp.mp_001.dto.Page_DTO;
import vs.mp.mp_001.vo.MP_001_3_VO;
import vs.ms.ms_001.vo.MS_001_VO;


@Controller
public interface MP_001_Controller {

	ModelAndView MP_001_1(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView MP_001_3(Page_DTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception;

	String myCourse(Page_DTO dto) throws JsonProcessingException;

	ModelAndView memberUpdate(MS_001_VO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
