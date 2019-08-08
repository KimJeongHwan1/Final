package web.dao.face;

import java.util.List;

import web.dto.Member;
import web.dto.UserPage;

public interface TongDao {
	
	public List selectListFwgDao(String loginid);
	
	public List selectListFwrDao(String loginid);
	
	public List selectTimeLine(String loginid);
	
	public List getcontent_noDao(int member_code);
	
	public List selectUserpageInfo(int content_no);
	
	public int followingCnt( String loginid ) ;
	
	public int followerCnt( String loginid ) ;
	
	public int commentCnt( String loginid ) ;
	
	public int listCnt( int member_code ) ;
 	
	public List selectFavContentNo(String loginid);
	
	public List selectFavList(int content_no);
	
	public void deleteList( int content_no ) ;
	
	public void updateList( UserPage userPage ) ;

	public List getWriteListDao(Member member);
	
	public void updateBlockSeeDao(UserPage userPage);
	
	public int favoriteCnt( String loginid ) ;
	
	
}
