package web.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import web.dto.Member;
import web.dto.UserImg;
import web.service.face.MemberService;

@Controller
public class MemberController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼");
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(Member member, HttpSession session) {
		logger.info("로그인 처리");
		
		logger.info(member.toString());
		
		String redirectUrl = null;
		
		if( memberService.login(member)) {
			//로그인 성공
			redirectUrl = "/member/main";
			
			//세션 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("loginid", member.getMember_id());
		} else {
			//로그인 실패
			redirectUrl = "/member/login";
		}
		
		return "redirect:" + redirectUrl;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:" + "/member/main";
	}
	
	@RequestMapping(value="/member/updateInfo", method=RequestMethod.GET)
	public void updateInfo(HttpSession session, Model model) {
		
		String loginid = (String)session.getAttribute("loginid");
		logger.info(loginid);
		
		Member member = memberService.selectMemberInfo(loginid);
		logger.info(member.toString());
		
		model.addAttribute("member", member);
		
		int member_code = memberService.getMember_code(loginid);
		
		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} else {
			model.addAttribute("img", "not_img");
		}
		
	}
	
	@RequestMapping(value="/member/updateInfo", method=RequestMethod.POST)
	public String updateInfoProc(
			Member member,
			@RequestParam(value="file")MultipartFile fileupload, HttpSession session) {
		
		String loginid = (String)session.getAttribute("loginid");
		logger.info(member.toString());
		logger.info(fileupload.getOriginalFilename());
		
		int member_code = memberService.getMember_code(loginid);
		
		memberService.updateInfo(member);
		
		memberService.imgsave(fileupload, context, member_code);
		return "redirect:"+"/member/updateInfo";
		
	}
	
	@RequestMapping(value="/member/updatePw", method=RequestMethod.GET)
	public void updatePw() {
		
		
	}
	
	@RequestMapping(value="/member/main", method=RequestMethod.GET)
	public void main() {
		
	}
	
	
}
