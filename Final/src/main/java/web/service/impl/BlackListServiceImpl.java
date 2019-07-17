package web.service.impl;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.BlackListDao;
import web.dto.BlackList;
import web.service.face.BlackListService;
import web.util.BlackListPaging;

@Service
public class BlackListServiceImpl implements BlackListService {

	@Autowired BlackListDao blacklistDao;
	
	@Override
	public BlackListPaging getCurPage(Map<String, Object> map) {

		int totalCount = blacklistDao.selectCntAll(map);
		int curPage = Integer.parseInt(  map.get("curPage").toString());
		
		BlackListPaging paging = new BlackListPaging(totalCount,curPage);
		
		return paging;
		
		
	}

	@Override
	public List getBlackList(BlackListPaging blacklistPaging) {
		
		return blacklistDao.selectAllBlackList(blacklistPaging);
	}
	
	@Override
	public void deleteBlackList(int black_no) {
		
		
		blacklistDao.deleteBlackList(black_no);
		
	}

	@Override
	public void blackDeleteMember(int member_code ) {
		
		
		blacklistDao.blackDeleteByMember_code(member_code);
		
		blacklistDao.blackDeleteMember(member_code);
		
	}



}
