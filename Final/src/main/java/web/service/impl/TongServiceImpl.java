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

	@Override
	public int following_Cnt(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.followingCnt(loginid) ;
	}

	@Override
	public int follower_Cnt(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.followerCnt(loginid) ;
	}

	@Override
	public int comment_Cnt(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.commentCnt(loginid);
	}

	@Override
	public int list_Cnt(int member_code) {
		// TODO Auto-generated method stub
		return tongDao.listCnt(member_code) ;
	}

	@Override
	public List favContentNo(String loginid) {
		// TODO Auto-generated method stub
		return tongDao.selectFavContentNo(loginid);
	}

	@Override
	public List getFavList(List list) {
		List sum = new ArrayList();
		List sum2 = new ArrayList();
		int m=0;
		int n=0;
		for(int i=0; i<list.size(); i++) {
			n=(Integer)list.get(i);
			sum = tongDao.selectFavList(n);
			

			sum2.add(m, sum.get(0));
			m++;

		}
		
		return sum2;
	}
	
}
