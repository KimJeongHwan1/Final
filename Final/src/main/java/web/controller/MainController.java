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

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@Autowired MemberService memberService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main1() {
		
	}
	
	
	
	@RequestMapping(value="/calendar/calendar", method=RequestMethod.GET)
	public void calendar(Member member, HttpSession session, Model model) {
		
		// 헤더 import문제로 코드추가
		String loginid = (String) session.getAttribute("loginid");
		
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
		
	}
}
