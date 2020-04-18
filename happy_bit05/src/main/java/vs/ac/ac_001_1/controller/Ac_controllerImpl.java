package vs.ac.ac_001_1.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vs.ac.ac_001_1.domain.AcVO;
import vs.ac.ac_001_1.service.Ac_Service;

@Controller
public class Ac_controllerImpl implements Ac_controller{
	 
	@Autowired
	Ac_Service ac_service;
	@Autowired
	AcVO acvo;
	
	@Override
	@RequestMapping(value="/ac_001_1")
	public ModelAndView Ac_List(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		System.out.println("¿©±â´Â ControllerImpl");

		List<AcVO> list = ac_service.Ac_List();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ac/ac_002_1");

		return mav;
		
		
	}
	
		
	
	
	
}
