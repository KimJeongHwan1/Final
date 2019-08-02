package web.service.face;

import java.util.List;

import web.dto.Following;

public interface TongService {
	
	public List selectListFwg(String loginid);
	
	public List selectListFwr(String loginid);
	
	public List timeLinePage(String loginid);
	
	public List getcontent_no(int member_code);
	
	public List getTimeLine(List list);
}
