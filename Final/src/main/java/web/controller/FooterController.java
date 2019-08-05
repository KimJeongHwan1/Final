package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.dto.UserImg;
import web.service.face.MemberService;
import web.service.face.UserPageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FooterController {
	
	private static final Logger logger = LoggerFactory.getLogger(FooterController.class);
	
	@Autowired MemberService memberService;
	@Autowired UserPageService userpageService;
	
	@RequestMapping(value = "/layout/search", method = RequestMethod.GET)
	public void search() {
		
	}
	
	@RequestMapping(value = "/layout/search", method = RequestMethod.POST)
	public void searchProc(String text, Model model) {
		logger.info(text);
		
		List memberList = memberService.headerSearchMember(text);
//		List memberImgList = memberService.headerSearchMemberImg(text);
		List userpageList = userpageService.headerSearchUserpage(text);
		
		model.addAttribute("memberList", memberList);
//		model.addAttribute("memberImgList", memberImgList);
		model.addAttribute("userpageList", userpageList);
		
	}
	
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
