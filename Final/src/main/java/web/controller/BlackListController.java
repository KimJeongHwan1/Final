package web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import web.dto.BlackList;
import web.dto.Member;
import web.dto.UserPage;
import web.service.face.BlackListService;
import web.service.face.MemberService;
import web.util.BlackListPaging;


@Controller
public class BlackListController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlackListController.class);
	
	//서비스객체
	@Autowired BlackListService blacklistService;
	@Autowired MemberService memberService;
	
	@RequestMapping(value="/black/list", method=RequestMethod.GET)
	
	public void blackList(
			@RequestParam(defaultValue="1") int curPage, Model model, BlackList blacklist, Member member, HttpSession session) {
		
		logger.info("블랙리스트 폼");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);

		BlackListPaging paging = blacklistService.getCurPage(map);
		
		model.addAttribute("blacklistpaging",paging);		
				
		List blist = blacklistService.getBlackList(paging);
		
		model.addAttribute("blacklist", blist);
		
		// 헤더 import문제로 코드추가
		String loginid = (String)session.getAttribute("loginid");
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
	}
	

	@RequestMapping(value="/black/delete", method=RequestMethod.GET)
	
	public String blackDelete( int black_no  ) {
		
		logger.info("블랙리스트 삭제 처리 폼");
		
		
		blacklistService.deleteBlackList(black_no);
		
		
		return "redirect:/black/list";
	}		
	
	
	@RequestMapping(value="/black/deleteMember", method=RequestMethod.GET)
	
	public String blackDeleteMember( int member_code ) {
		
		logger.info("블랙리스트 회원탈퇴 처리 폼");
		
		blacklistService.blackDeleteMember(member_code);
		
		return "redirect:/black/list";
	}		

	@RequestMapping(value="/black/insert", method=RequestMethod.GET)
	
	public void blackInsertProc(  HttpSession session, String decl, String id, int content_no ) {
		
		logger.info("블랙리스트  인서트 처리 폼");

		String loginid = (String)session.getAttribute("loginid");
		int member_code = memberService.getMember_code(id);
		
		BlackList blacklist = new BlackList();
		
		// 신고자
		blacklist.setBlack_reporter(loginid);
		
		// 신고내용
		blacklist.setBlack_content(decl);
		// 신고당한 사람 ( 신고 받은사람 )					
		blacklist.setBlack_perpetrator(id);
		// 신고당한 사람코드 ( 신고 받은사람코드 )					
		blacklist.setMember_code(member_code);
		// 신고당한 글번호 ( 신고당한 글번호 )	
		blacklist.setContent_no(content_no);
		
		logger.info(blacklist.toString());		
				
		blacklistService.insertBlackList(blacklist);
		
		
		
	}	
	
}
