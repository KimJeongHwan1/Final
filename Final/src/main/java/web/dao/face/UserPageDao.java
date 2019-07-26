package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.UserPage;
import web.dto.Userpage_comment;

public interface UserPageDao {
	public void insertImg(UserPage userpage);
	public void insertwriteInfo(UserPage userpage);
	
	public List<UserPage> getwriteListDao(Member member);
	
	public UserPage selectByContentno(UserPage userpage);
	public void insertCommentDao(Userpage_comment userComm);
	
	public List selectCommentDao(int page_no);
	
}
