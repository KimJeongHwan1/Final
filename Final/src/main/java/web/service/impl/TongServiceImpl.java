package web.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.TongDao;
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
	public List getcontent_no(int member_code) {
		// TODO Auto-generated method stub
		return tongDao.getcontent_noDao(member_code);
	}

	@Override
	public List getTimeLine(List list) {
		int[] n = new int[list.size()];
		for(int i=0; i<n.length; i++) {
			n[i] = (Integer) list.get(i);
		}
		
		Arrays.sort(n);
		int m = 0;
		List sum = new ArrayList();
		List sum2 = new ArrayList();
		for(int i=n.length-1; i>=0; i--) {
			sum = tongDao.selectUserpageInfo(n[i]);
			
			for(int j=0; j<sum.size(); j++) {
				sum2.add(m, sum.get(j));
				m++;
			}
		}
		
		return sum2;
	}
	
}