package web.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Favorites;
import web.dto.Following;
import web.dto.Good;
import web.dto.Member;
import web.dto.UserImg;
import web.dto.UserPage;
import web.dto.Userpage_cocomment;
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
	public void bestlist( Member member, Model model , HttpSession session) {
		
		
		List<UserPage> bestList = userpageService.getbestlist(member) ;
		
		model.addAttribute( "list" , bestList ) ;

		// 헤더 import문제로 코드추가
		String loginid = (String) session.getAttribute("loginid");
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
	}
	
	@RequestMapping(value = "/best/view", method = RequestMethod.GET)
	public void view(UserPage userpage, Model model, Good good, String member_id, HttpSession session) {
			
	UserPage userPage = userpageService.selectUserpage(userpage);

	model.addAttribute("userpage", userPage);
	
	String stdname = userPage.getStoredname();
	List stdList = new ArrayList();
	
	if(userPage.getOriginname() != null) {
		int stdcheck=0;
		int stdcheck2=0;
		for(int i=1; i<=stdname.length(); i++) {
			if(stdname.substring(i-1, i).equals(" ")) {
				stdList.add(stdcheck, stdname.substring(stdcheck2, i-1));
				stdcheck2= i;
				stdcheck++;
			} else if(i == stdname.length()) {
				stdList.add(stdcheck, stdname.substring(stdcheck2, i));
			}
		}
		stdcheck2++;
		model.addAttribute("multiImgSize", stdcheck2);
	}
	model.addAttribute("multiImg", stdList);
	
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
		}
		for(int i=0; i<check2; i++) {
			str3[i] = str2[i];
		}
		List<String> tagList = new ArrayList<String>();
		for(int i=0; i<check2; i++) {
			tagList.add(str3[i]);
		}
		model.addAttribute("tagList", tagList);
	}

	int member_code = userPage.getMember_code();

	String id = memberService.getmember_id(member_code);

	model.addAttribute("id", id);
	model.addAttribute("member_code", member_code);


	if(memberService.selectImgCheck(member_code)) {
		UserImg userImg = memberService.selectImg(member_code);
		model.addAttribute("img", userImg);
	} 

	model.addAttribute("bool", memberService.selectImgCheck(member_code));

	int page_no = userPage.getContent_no();

	// 좋아요 기능

	member_id = (String) session.getAttribute("loginid");

	good.setMember_id(member_id);

	int goodCheck = memberService.goodCheck(good);
	model.addAttribute("goodCheck", goodCheck);

	int goodnum = memberService.saveGoodCount(userpage.getContent_no());

	model.addAttribute("good_no", goodnum);

	List list = userpageService.selectComment(page_no);

	//		logger.info(list.toString());

	model.addAttribute("list", list);

	List userImg = userpageService.selectUserImgAll();

	model.addAttribute("userImg", userImg);

	List<Userpage_cocomment> cocomentList = userpageService.selectcocomentAll();

	model.addAttribute("cocomentList", cocomentList);

	Favorites fav = new Favorites();

	fav.setContent_no(userpage.getContent_no());
	fav.setMember_id(member_id);

	int fav_check = userpageService.checkfavorites(fav);

	model.addAttribute("fav_check", fav_check);

		
		// 헤더 import문제로 코드추가
		String loginid = (String)session.getAttribute("loginid");

	}
	
	}
