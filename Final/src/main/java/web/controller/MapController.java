package web.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.face.MapDao;
import web.dto.MapAddress;

@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired MapDao mapDao;
	
	@RequestMapping(value = "/map/map", method = RequestMethod.GET)
	public void map( MapAddress map, Model model, HttpSession session, String x, String y, String address ) {
		
		
		logger.info("맵 조회 페이지");
		
		
		// 로그인 id 불러오기
		String loginid = (String) session.getAttribute("loginid");
		
		logger.info(loginid);
		
		// addno을 추후 boardno으로 변경해야함
		map = mapDao.selectByMember_id(loginid);				
		
		model.addAttribute("map", map);
		
		logger.info(map.toString());
		
	}
	
	@RequestMapping(value = "/map/mapInsert", method = RequestMethod.GET)
	public void mapInsert( MapAddress mapAddress, Model model, HttpSession session, String x, String y, String address ) {
		
		
		logger.info("맵 저장 페이지");
		
	}	
	
	
	
	@RequestMapping(value = "/map/mapInsert", method = RequestMethod.POST)
	public String mapInsertProc( MapAddress mapAddress, Model model, HttpSession session, String x, String y, String address ) {
		
		
		logger.info("맵 저장 처리 페이지");
		
		// 로그인 id 불러오기
		String loginid = (String) session.getAttribute("loginid");
		
		logger.info(loginid);
			
		
		logger.info(mapAddress.toString());

		mapAddress.setMember_id(loginid);
		
		mapDao.insertMap(mapAddress);
		

		return "redirect:/map/map";
		
	}	
	

	@RequestMapping(value = "/map/mapUpdate", method = RequestMethod.GET)
	public void mapUpdate( MapAddress mapAddress, Model model, HttpSession session, String x, String y, String address, int addno ) {
		
		logger.info("맵 수정 페이지");
		
	}	

	@RequestMapping(value = "/map/mapUpdate", method = RequestMethod.POST)
	public String mapUpdateProc( MapAddress mapAddress, Model model, HttpSession session, String x, String y, String address, int addno ) {
		
		
		logger.info("맵 수정 처리 페이지");
		
		// 로그인 id 불러오기
		String loginid = (String) session.getAttribute("loginid");
		
		logger.info(loginid);		
		
		
		mapAddress.setMember_id(loginid);
		
		mapDao.updateMap(mapAddress);

		return "redirect:/map/map";
		
	}
	
	@RequestMapping(value = "/map/mapDelete", method = RequestMethod.GET)
	public String mapDelete( MapAddress mapAddress, Model model, HttpSession session, String x, String y, String address, int addno ) {
		
		
	logger.info("맵 삭제 페이지");
		
		// 로그인 id 불러오기
		String loginid = (String) session.getAttribute("loginid");
		
		logger.info(loginid);
			
		
		logger.info(mapAddress.toString());

		mapAddress.setMember_id(loginid);
		
		mapDao.deleteMap(mapAddress);
		

		return "redirect:/map/mapInsert";
		
	}
	
	

	
}
