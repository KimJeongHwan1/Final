package web.dao.face;

import java.util.List;

import web.dto.Following;

public interface TongDao {
	
	public List selectListFwgDao(String loginid);
	
	public List selectListFwrDao(String loginid);
	
	public List selectTimeLine(String loginid);
	
	public List getcontent_noDao(int member_code);
	
	public List selectUserpageInfo(int content_no);
	
}