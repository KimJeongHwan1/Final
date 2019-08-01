package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.UserImg;
import web.dto.UserPage;
import web.dto.Userpage_cocomment;
import web.dto.Userpage_comment;

public interface UserPageDao {
	public void insertImg(UserPage userpage);
	public void insertwriteInfo(UserPage userpage);
	
	public List<UserPage> getwriteListDao(Member member);
	
	public UserPage selectByContentno(UserPage userpage);
	public void insertCommentDao(Userpage_comment userComm);
	
	public List<Userpage_comment> selectCommentDao(int page_no);
	
	public List<UserImg> selectUserImgAllDao();
	
	public void insertCocommentDao(Userpage_cocomment cocoment);

	public List<Userpage_cocomment> selectcocomentDao(int cocoment);
	public List<Userpage_cocomment> selectcocomentAllDao();
	
	public List<UserPage> bestList( UserPage userpage ) ;
}
