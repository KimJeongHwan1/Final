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
import web.service.face.BlackListService;
import web.util.BlackListPaging;


@Controller
public class BlackListController {
	
	private static final Logger logger = LoggerFactory.getLogger(BlackListController.class);
	
	//서비스객체
	@Autowired BlackListService blacklistService;
	
	@RequestMapping(value="/black/list", method=RequestMethod.GET)
	
	public void blackList(
			@RequestParam(defaultValue="1") int curPage,Model model, BlackList blacklist) {
		
		logger.info("블랙리스트 폼");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("curPage",curPage);

		BlackListPaging paging = blacklistService.getCurPage(map);
		
		model.addAttribute("blacklistpaging",paging);		
				
		List blist = blacklistService.getBlackList(paging);
		
		model.addAttribute("blacklist", blist);
		
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
	
	
	
}
