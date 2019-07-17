package web.service.face;

import java.util.List;


import java.util.Map;

import web.util.BlackListPaging;

public interface BlackListService {
	
	public List getBlackList(BlackListPaging blacklistPaging);
	
	public BlackListPaging getCurPage(Map<String,Object> map);

	public void deleteBlackList(int black_no);
	
	public void blackDeleteMember(int member_code );
	
}
