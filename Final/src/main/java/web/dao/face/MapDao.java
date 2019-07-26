package web.dao.face;

import web.dto.MapAddress;

public interface MapDao {
	
	
	// Map API 메소드
	
	public MapAddress selectByMember_id(String member_id );
	
	public void insertMap(MapAddress mapAddress);
	
	public void updateMap(MapAddress mapAddress);
	
	public void deleteMap(MapAddress mapAddress);
	
}
