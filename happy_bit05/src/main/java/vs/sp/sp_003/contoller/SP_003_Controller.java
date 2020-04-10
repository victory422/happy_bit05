package vs.sp.sp_003.contoller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;


@Controller
public interface SP_003_Controller {

	public ModelAndView SP_003(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	}
