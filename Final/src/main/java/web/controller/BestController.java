package web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.dto.UserPage;
import web.service.face.MemberService;
import web.service.face.UserPageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BestController.class);
	
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	@Autowired UserPageService userpageService;
	
	@RequestMapping(value = "/best/list", method = RequestMethod.GET)
	public void bestlist( Member member, Model model ) {
		
		List<UserPage> bestList = userpageService.getbestlist(member) ;
		
		model.addAttribute( "list" , bestList ) ; 
	}
	
	@RequestMapping(value = "/best/view", method = RequestMethod.GET)
	public void bestview( ) { }
	
	}
