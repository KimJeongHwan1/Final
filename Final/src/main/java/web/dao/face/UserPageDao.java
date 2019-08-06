package web.dao.face;

import java.util.List;

import web.dto.Favorites;
import web.dto.Following;
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
	public void insertCommentCountDao(int page_no);
	
	public List<Userpage_comment> selectCommentDao(int page_no);

	public List<UserImg> selectUserImgAllDao();

	public void insertCocommentDao(Userpage_cocomment cocoment);

	public List<Userpage_cocomment> selectcocomentDao(int cocoment);
	public List<Userpage_cocomment> selectcocomentAllDao();

	public void deleteCommentDao(Userpage_comment cocoment);
	public void deleteCommentCountDao(int page_no);
	
	public void deletecoCommentDao(int cocomment_no);

	public List selectTagDao(String tag);

	public List selectSearchHeader(String text);

	public int followingCheck(Following fwg);
	public void insertFollowingDao(Following fwg);
	public void deleteFollowingDao(Following fwg);

	public List<UserPage> bestList(Member member) ;

	public void hit(UserPage userpage);
	
	public int favoritesCheck(Favorites fav);
	public void insertfavoritesDao(Favorites fav);
	public void deletefavoritesDao(Favorites fav);
	
	public UserPage userpageSelectByContent_no(int content_no);
}
