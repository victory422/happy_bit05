package vs.sp.sp_003.contoller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application shop page.
 */
@Controller
public class SP_003_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(SP_003_Controller.class);
	
	/**
	 * Simply selects the shop view to render by returning its name.
	 */
	@RequestMapping(value = "/sp_003_1", method = RequestMethod.GET)
	public String shop(Locale locale, Model model) {
		logger.info("Welcome shop! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "SP/SP_003_1";
	}
	
}
