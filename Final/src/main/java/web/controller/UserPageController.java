package web.controller;



import java.util.ArrayList;
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

import web.dto.Following;
import web.dto.Good;
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


	@RequestMapping(value = "/userpage/userpage", method = RequestMethod.GET)
	public void userpage(Member member, Model model, HttpSession session) {
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
		
		
		String loginid = (String) session.getAttribute("loginid");
		Following fwg = new Following();
		fwg.setFwg_user_id(id);
		fwg.setFwg_you_id(loginid);
		
		int check = userpageService.checkFollowing(fwg);
		
		model.addAttribute("check", check);
	}

	@RequestMapping(value = "/userpage/view", method = RequestMethod.GET)
	public void view(UserPage userpage, Model model, Good good, String member_id, HttpSession session) {
		logger.info(userpage.toString());

		UserPage userPage = userpageService.selectUserpage(userpage);

		logger.info(userPage.toString());

		model.addAttribute("userpage", userPage);
		
		String tag = userPage.getTag();
		if(tag != null) {
			int num=0;
			int num2=0;
			int check=0;
			int check2=0;
			String str=null;
			String[] str2=new String[tag.length()];
			char chr=0;
			char chr2=0;
			logger.info("가져온 태그"+tag);
			for(int i=0; i<tag.length(); i++) {
				chr = tag.charAt(i);
				num = (int) chr;
				
				if(num == 32) {
					str = tag.substring(check, i);
					chr2 = tag.charAt(check);
					num2 = (int) chr2;
					if(num2 == 35) {
						str = tag.substring(check+1, i);
					}
					str2[check2] = str;
					
					check=i+1;
					check2++;
				}
				if(i==tag.length()-1) {
					str = tag.substring(check, i+1);
					chr2 = tag.charAt(check);
					num2 = (int) chr2;
					if(num2 == 35) {
						str = tag.substring(check+1, i+1);
					}
					str2[check2] = str;
					check2++;
				}
				
			}
			String[] str3 = new String[check2];
			for(int i=0; i<check2; i++) {
				logger.info("i번쨰"+str2[i]);
			}
			for(int i=0; i<check2; i++) {
				str3[i] = str2[i];
				logger.info("i번쨰"+str3[i]);
			}
			List<String> tagList = new ArrayList<String>();
			for(int i=0; i<check2; i++) {
				tagList.add(str3[i]);
			}
			model.addAttribute("tagList", tagList);
			logger.info(tagList.toString());
		}
		
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


		// 좋아요 기능

		member_id = (String) session.getAttribute("loginid");

		good.setMember_id(member_id);

		//		int goodCheck = memberService.goodCheck(good);
		//		model.addAttribute("goodCheck", goodCheck);


		List list = userpageService.selectComment(page_no);

		//		logger.info(list.toString());

		model.addAttribute("list", list);

		List userImg = userpageService.selectUserImgAll();

		model.addAttribute("userImg", userImg);

		List<Userpage_cocomment> cocomentList = userpageService.selectcocomentAll();

		model.addAttribute("cocomentList", cocomentList);

	}


	//	@RequestMapping(value="/userpage/good", method=RequestMethod.GET)
	//	public String recommend(int content_no, HttpSession session, Model model, Good good) {
	//		
	//		logger.info("좋아요 폼_좋아요 UP AND DOWN");
	//		String member_id = (String) session.getAttribute("loginid");
	//		
	//		logger.info(member_id);
	//		
	//		memberService.saveGoodId( member_id, content_no);
	//		
	//		int goodnum = memberService.saveGoodCount(content_no);
	//
	//		
	//		model.addAttribute("good_no", goodnum);
	//		
	//		good.setContent_no(content_no);
	//		good.setMember_id(member_id);
	//		
	//		int goodcheck = memberService.goodCheck(good);
	//
	//		model.addAttribute("goodcheck", goodcheck);
	//		return "/userpage/good";
	//	}
	//	
	//	@RequestMapping(value="/userpage/goodbtn", method=RequestMethod.GET)
	//	public String recobtn(int content_no, HttpSession session, Model model, Good good) {
	//		logger.info("좋아요 폼_ 버튼이름 '좋아요' OR '좋아요취소'");
	//		String userid = (String) session.getAttribute("loginid");
	//		
	//		good.setContent_no(content_no);
	//		good.setMember_id(userid);
	//		
	//		int goodcheck = memberService.goodCheck(good);
	//		logger.info(good.toString());
	//		
	//		model.addAttribute("goodcheck", goodcheck);
	//		
	//		
	//		return "/userpage/goodbtn";
	//	}



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
	
	@RequestMapping(value = "/userpage/commDelete", method = RequestMethod.GET)
	public void commDelete(int page_no, HttpSession session, int comment_no, Model model) {

		String id = (String) session.getAttribute("loginid");

		Userpage_comment comment = new Userpage_comment();

		comment.setMember_id(id);
		comment.setPage_no(page_no);
		comment.setComment_no(comment_no);

		userpageService.deletecomment(comment);
	}

	@RequestMapping(value = "/userpage/cocommDelete", method = RequestMethod.GET)
	public void cocommDelete(int cocomment_no, HttpSession session, Model model) {
		logger.info("댓글-댓글 삭제폼");
		String id = (String) session.getAttribute("loginid");

		userpageService.deletecoComment(cocomment_no);

	}

	@RequestMapping(value = "/userpage/tag", method = RequestMethod.GET)
	public void tag(String tag, Model model) {

		logger.info(tag);
		List list = userpageService.selectTag(tag);

		logger.info(list.toString());

		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/userpage/following", method = RequestMethod.GET)
	public void following(String user_id, HttpSession session, Model model) {
//		logger.info(user_id);
		
		String loginid = (String) session.getAttribute("loginid");
		
		int fwg_user_code = memberService.getMember_code(user_id);
		int fwg_you_code = memberService.getMember_code(loginid);
		
		Following fwg = new Following();
		fwg.setFwg_user_code(fwg_user_code);
		fwg.setFwg_user_id(user_id);
		
		fwg.setFwg_you_code(fwg_you_code);
		fwg.setFwg_you_id(loginid);
		
		userpageService.Following(fwg);
		
		int check = userpageService.checkFollowing(fwg);
		
		model.addAttribute("check", check);
	}
}
