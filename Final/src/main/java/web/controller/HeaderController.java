package web.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.face.MemberService;
import web.service.face.UserPageService;


@Controller
public class HeaderController {
	
	private static final Logger logger = LoggerFactory.getLogger(HeaderController.class);
	
	@Autowired MemberService memberService;
	@Autowired UserPageService userpageService;
	
	@RequestMapping(value="/layout/header", method=RequestMethod.GET)
	public void header(HttpSession session, Model model, Member member ) {
		
		String loginid = (String)session.getAttribute("loginid");
		logger.info(loginid);
		
		member.setMember_id(loginid);
		
		member = memberService.getMember(member);
		
		
		int member_code = memberService.getMember_code(loginid);
		member.setMember_code(member_code);
		
		logger.info(member.toString());
			
	}

	
}
