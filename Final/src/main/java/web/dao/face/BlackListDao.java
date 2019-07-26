package web.dao.face;

import java.util.List;
import java.util.Map;
import web.dto.MapAddress;

import web.dto.BlackList;
import web.util.BlackListPaging;

public interface BlackListDao {
	
	
	public List selectAllBlackList(BlackListPaging blacklistPaging);
	
	public int selectCntAll(Map<String, Object> map);
	
	public void deleteBlackList(int black_no);
	
	public void blackDeleteMember(int member_code);
	
	public void blackDeleteByMember_code(int member_code);
	
	
	// Map API 메소드
	
	public MapAddress selectByMember_id(String member_id );
	
	public void insertMap(MapAddress mapAddress);
	
	public void updateMap(MapAddress mapAddress);
	
	public void deleteMap(MapAddress mapAddress);
	
	
}
