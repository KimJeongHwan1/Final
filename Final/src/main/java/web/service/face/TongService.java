package web.service.face;

import java.util.List;

import web.dto.Following;

public interface TongService {
	
	public List selectListFwg(String loginid);
	
	public List selectListFwr(String loginid);
	
	public List timeLinePage(String loginid);
	
	public List userpageList(int str);
}
