package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.UserPage;

public interface MyPageDao {

	public List<UserPage> MyPageList(Member member);
	public int selectCntAll();
}
