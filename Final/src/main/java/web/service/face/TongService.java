package web.service.face;

import java.util.List;

import web.dto.Member;
import web.dto.UserPage;

public interface TongService {
	
	public List selectListFwg(String loginid);
	
	public List selectListFwr(String loginid);
	
	public List timeLinePage(String loginid);
	
	public List getcontent_no(int member_code);
	
	public List getTimeLine(List list);
	
	public int following_Cnt( String loginid ) ;
	
	public int follower_Cnt( String loginid ) ;
	
	public int comment_Cnt( String loginid ) ;
	
	public int list_Cnt( int member_code ) ;
	
	public List favContentNo(String loginid);
	
	public List getFavList(List list);
	
	public void deleteList( int content_no ) ;
	
	public void updateList( UserPage userPage ) ;
	
	public List getWriteList(Member member);
	
	public void updateBlockSee(UserPage userPage);
	
	
}
