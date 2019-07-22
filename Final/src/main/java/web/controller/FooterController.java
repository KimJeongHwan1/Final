package web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FooterController {
	
	private static final Logger logger = LoggerFactory.getLogger(FooterController.class);
	
	@RequestMapping(value = "/layout/intro", method = RequestMethod.GET)
	public void intro() {
		logger.info("인트로");
	}
	
	
	@RequestMapping(value = "/layout/rule", method = RequestMethod.GET)
	public void rule() {
		logger.info("지침");
	}
	
	
	@RequestMapping(value = "/layout/policy", method = RequestMethod.GET)
	public void policy() {
		logger.info("정책");
	}
	
	
	@RequestMapping(value = "/layout/terms", method = RequestMethod.GET)
	public void terms() {
		logger.info("약관");
	}
	
	
}
