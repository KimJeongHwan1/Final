package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MyPageDao;
import web.dto.Member;
import web.dto.UserPage;
import web.service.face.MyPageService;
import web.util.Paging;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired MyPageDao mypageDao;
	
	@Override
	public List<UserPage> MyPageList(Member member) {
		return mypageDao.MyPageList(member);
	}
	
	public Paging CurPage(HttpServletRequest req) {
		// 전달파라미터 curPage 파싱
		String param = req.getParameter("curPage");

		int curPage = 0;
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}

		// 전체 게시글 수
		int totalCount = mypageDao.selectCntAll();

		// 페이징 객체 생성
		Paging paging = new Paging(totalCount, curPage);

		return paging;
	}
	
}
