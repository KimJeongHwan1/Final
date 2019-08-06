package web.dao.face;

import java.util.List;

import org.springframework.web.socket.TextMessage;

import web.dto.Websocket;

public interface ChatDao {
	
	
	public void chatinsert(Websocket websocket);
	
	
	
	public List view(Websocket websocket); 
	
	
}
