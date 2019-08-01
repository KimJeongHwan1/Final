package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TongDao;
import web.dto.Following;
import web.service.face.TongService;

@Service
public class TongServiceImpl implements TongService {
	
	@Autowired TongDao tongDao;
	
	@Override
	public List selectListFwg(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.selectListFwgDao(loginid);
	}

	@Override
	public List selectListFwr(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.selectListFwrDao(loginid);
	}

	@Override
	public List timeLinePage(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.selectTimeLine(loginid);
	}

	@Override
	public List userpageList(int str) {
		// TODO Auto-generated method stub
		return tongDao.userpageListDao(str);
	}
	
}
