package web.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import web.dto.UserPage;
import web.service.face.MemberService;
import web.service.face.MyPageService;
import web.service.face.UserPageService;
import web.util.Paging;


@Controller
public class TongController {
	
	private static final Logger logger = LoggerFactory.getLogger(TongController.class);
	
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	@Autowired MyPageService mypageService;
	@Autowired UserPageService userpageService;
	
	@RequestMapping(value="/tong/mypage", method=RequestMethod.GET)
	public void mypage(HttpSession session, Model model, Member member) {
		
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
	
	@RequestMapping(value = "/tong/appendlist", method = RequestMethod.GET)
	public void appendlist(HttpSession session, Model model, HttpServletRequest req, Member member) {
		
		String loginid = (String)session.getAttribute("loginid");
		
		member.setMember_id(loginid);
		
		member = memberService.getMember(member);
		
		Paging paging = mypageService.CurPage(req);
		
		req.setAttribute("paging", paging);
		
		
		List<UserPage> MyPageList = mypageService.MyPageList(member);
		
//		logger.info(MyPageList.toString());
		
		model.addAttribute("mypagelist", MyPageList);
		
	}
	
	@RequestMapping(value = "/tong/write", method = RequestMethod.GET)
	public void write() {
		
	}
	
	@RequestMapping(value = "/tong/write", method = RequestMethod.POST)
	public void writeProc(HttpSession session, UserPage userpage,
			@RequestParam(value="file")MultipartFile fileupload) {
		
		String loginid = (String)session.getAttribute("loginid");
		
		int member_code = memberService.getMember_code(loginid);
		userpage.setMember_code(member_code);
		
		if(fileupload.getOriginalFilename().equals("")) {
			userpageService.insertwrite(userpage);
		} else {
			userpageService.imgsave(fileupload, context, userpage);
		}
	}
	
	
	
	
	
	
	
	
	
}
