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


	//로그 라이브러리 객체
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);

	@Autowired ServletContext context;
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
			redirectUrl = "/member/main";

		} else {
			//로그인 실패

			//리다이렉트 URL 지정
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
	public void updateInfo(HttpSession session, Model model, Member member) {
		
		String loginid = (String)session.getAttribute("loginid");
		logger.info(loginid);
		
		member.setMember_id(loginid);
		
		member = memberService.getMember(member);
		logger.info(member.toString());
		
		model.addAttribute("member", member);
		
		int member_code = memberService.getMember_code(loginid);
		
		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
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
		if(fileupload.getOriginalFilename().equals("")) {
			
		} else {
			memberService.imgsave(fileupload, context, member_code);
		}
		return "redirect:"+"/member/updateInfo";
		
	}

	
	
	@RequestMapping(value="/member/updatePw", method=RequestMethod.GET)
	public void updatePw(HttpSession session, Model model) {
		
		String loginid = (String)session.getAttribute("loginid");
		
		int member_code = memberService.getMember_code(loginid);
		
		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
	}
	
	@RequestMapping(value="/member/pwChange", method=RequestMethod.GET)
	public void pwChange(HttpSession session, Model model, String member_pw0, String member_pw1, String member_pw2) {
		
		String loginid = (String) session.getAttribute("loginid");
		
		String loginpw = memberService.pwCheck(loginid);
		
//		logger.info("로그인 비밀번호     : " + loginpw);
//		logger.info("이전 비밀번호        : " + member_pw0);
//		logger.info("현재 비밀번호        : " + member_pw1);
//		logger.info("현재 비밀번호 확인 : " + member_pw2);
		
		int num = 0;
		
		if((loginpw.equals(member_pw0)) && (member_pw1.equals(member_pw2))) {
			if(member_pw0.equals(member_pw1)) {
				num = 0; //변경 성공		
			} 
		} else if((loginpw.equals(member_pw0)) && (!member_pw1.equals(member_pw2))) {
			num = 2; //새 새확인 불일치
		} else if((member_pw1.equals(member_pw2)) && (!loginpw.equals(member_pw0))) {
			num = 3; //로그인 이전 불일치
		} else {
			num = 4; //이전 새 새확인 불일치
		}
		
		if(num == 0) {
			memberService.updatePw(member_pw1, loginid);
		}
		model.addAttribute("result", num);
	}
	
	
	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public void delete() {
		
	}
	@RequestMapping(value="/member/memberdelete", method=RequestMethod.GET)
	public void memberdelete(HttpSession session, Model model, String pw) {
		
		String loginid = (String) session.getAttribute("loginid");
		
		String loginpw = memberService.pwCheck(loginid);
		logger.info("로그인 비밀번호     : " + loginpw);
		logger.info("이전 비밀번호        : " + pw);

		int num = 0;
		if(loginpw.equals(pw)) {
			num = 0; //탈퇴 성공		
		} else {
			num = 1; //탈퇴 실패
		}
		model.addAttribute("result", num);
	}
	@RequestMapping(value="/member/resultdelete", method=RequestMethod.POST)
	public String resultdelete(HttpSession session, Model model, String pw) {
		String loginid = (String) session.getAttribute("loginid");
		
		String loginpw = memberService.pwCheck(loginid);
		int member_code = memberService.getMember_code(loginid);
		String url = "member/delete";
		if(loginpw.equals(pw)) {
			memberService.memberdelete(loginid, member_code);
			session.invalidate();
			url = "member/resultdelete";
		} 
		return url;
	}




}
