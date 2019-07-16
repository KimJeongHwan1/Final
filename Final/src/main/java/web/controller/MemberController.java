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

@Controller
public class MemberController {
	
	//로그 라이브러리 객체
		private static final Logger logger
		= LoggerFactory.getLogger(MemberController.class);

	@Autowired MemberService memberService;
	
	@RequestMapping(value="/member/main", method=RequestMethod.GET)
	public void main() { }
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() { 
		logger.info("회원가입 폼");
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(Member member) {
		
		memberService.join(member); //회원가입 처리
		
		return "redirect:/member/main"; //main페이지로 리다이렉트
	
	}
	
	@RequestMapping(value="/member/idCheck", method=RequestMethod.GET)
	public String idCheck(Member member, Model model) {
		
		logger.info("아이디 : "+ member.toString());
		int check = 0;
		if(member.getMember_id().equals("")){
			check = 0;
		} else if(memberService.idCheck(member)) {
			check = 0;
		} else {
			check = 1;
		}
		model.addAttribute("check", check);
		return "member/joincheck";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼");
		
	}

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(
			Member member, //로그인 정보 커맨드 객체
			HttpSession session//세션 객체
			) {
		logger.info("로그인 처리");
		logger.info(member.toString());
	
		String redirectUrl = null;
		if( memberService.login(member) ) {
			//로그인 성공

			//id 로 member 조회
			member = memberService.getMember(member);

			//세션 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("loginid", member.getMember_id());
			session.setAttribute("nick", member.getMember_name());
			
			//리다이렉트 URL 지정
			redirectUrl = "/board/list";
			
		} else {
			//로그인 실패

			//리다이렉트 URL 지정
			redirectUrl = "/member/login";

		}
		
		return "redirect:" + redirectUrl;
	}
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(
			HttpSession session //세션 객체
			) {
		
		//세션 초기화
		session.invalidate();
		
		//메인 페이지로 리다이렉트
		return "redirect:/member/main";
	}
	
	
}
