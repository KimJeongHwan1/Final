package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Member;
import web.dto.UserPage;
import web.util.Paging;


public interface MyPageService {

	List<UserPage> MyPageList(Member member);
	
	public Paging CurPage(HttpServletRequest req);
	
}
