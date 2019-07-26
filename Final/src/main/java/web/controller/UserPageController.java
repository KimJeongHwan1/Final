package web.controller;



import java.util.List;

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
import web.dto.UserPage;
import web.dto.Userpage_cocomment;
import web.dto.Userpage_comment;
import web.service.face.MemberService;
import web.service.face.UserPageService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserPageController.class);
	
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	@Autowired UserPageService userpageService;
	
	@RequestMapping(value = "/userpage/write", method = RequestMethod.GET)
	public void write() {
		
	}
	
	@RequestMapping(value = "/userpage/write", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/userpage/userpage", method = RequestMethod.GET)
	public void userpage(Member member, Model model) {
		logger.info(member.toString());
		
		member = memberService.getMember(member);
		
		model.addAttribute("member", member);
		
		List<UserPage> writeList = userpageService.getwriteList(member);
		
		model.addAttribute("write", writeList);
		
		String id = member.getMember_id();
		model.addAttribute("user_id", id);
		
		
		int member_code = memberService.getMember_code(id);
		
		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
	}
	
	@RequestMapping(value = "/userpage/view", method = RequestMethod.GET)
	public void view(UserPage userpage, Model model) {
		logger.info(userpage.toString());
		
		UserPage userPage = userpageService.selectUserpage(userpage);
		
		logger.info(userPage.toString());
		
		model.addAttribute("userpage", userPage);
		
		int member_code = userPage.getMember_code();
		
		String id = memberService.getmember_id(member_code);
		
		logger.info(id);
		
		model.addAttribute("id", id);

		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
		
		int page_no = userPage.getContent_no();
		
		List list = userpageService.selectComment(page_no);
		
//		logger.info(list.toString());
		
		model.addAttribute("list", list);
		
		List userImg = userpageService.selectUserImgAll();
		
		model.addAttribute("userImg", userImg);
		
		List<Userpage_cocomment> cocomentList = userpageService.selectcocomentAll();
		
		model.addAttribute("cocomentList", cocomentList);
		
	}
	
	@RequestMapping(value = "/userpage/viewComment", method = RequestMethod.GET)
	public void viewComment(String comment, HttpSession session, int content_no, Model model) {
		logger.info(comment);
		String id = (String) session.getAttribute("loginid");
		
		
		Userpage_comment userComm = new Userpage_comment();
		int member_code = memberService.getMember_code(id);
		
		userComm.setContent(comment);
		userComm.setMember_code(member_code);
		userComm.setPage_no(content_no);
		userComm.setMember_id(id);
		
		userpageService.insertComment(userComm);
		
		int page_no = userComm.getPage_no();
		
		List<Userpage_comment> list = userpageService.selectComment(page_no);
		
//		logger.info(list.toString());
		
		model.addAttribute("list", list);
		
		List<UserImg> userImg = userpageService.selectUserImgAll();
		
		model.addAttribute("userImg", userImg);
		
		List<Userpage_cocomment> cocomentList = userpageService.selectcocomentAll();
		
		model.addAttribute("cocomentList", cocomentList);
		
	}
	
	@RequestMapping(value = "/userpage/coComment", method = RequestMethod.GET)
	public void coComment(int comment_no, Model model, String cocomment_content, HttpSession session) {
		
		String id = (String) session.getAttribute("loginid");
		int member_code = memberService.getMember_code(id);
		
		Userpage_cocomment cocoment = new Userpage_cocomment();
		cocoment.setComment_no(comment_no);
		cocoment.setContent(cocomment_content);
		cocoment.setMember_code(member_code);
		cocoment.setMember_id(id);
		
		userpageService.insertCocomment(cocoment);
		
		List<Userpage_cocomment> cocomentList = userpageService.selectcocoment(comment_no);
		
		logger.info(cocoment.toString());
		
		model.addAttribute("cocomentList", cocomentList);
		
		List userImg = userpageService.selectUserImgAll();
		
		model.addAttribute("userImg", userImg);
	}
}
