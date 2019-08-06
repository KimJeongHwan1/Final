package web.webSocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import web.dao.face.ChatDao;
import web.dto.Websocket;

public class EchoHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	@Autowired ChatDao chatDao;
	
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	
	
	
	
	//클라이언트와 연결 이후 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
		
		
		
		
	}

	//클라이언트가 서버로 메시지를 전송했을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		Map <String, Object> map = session.getAttributes();
	      String myId = (String)map.get("loginid"); // 내아이디
	      String userId = (String)map.get("userid");  // 상대 아이디

	      
	      // System.out.println(myId); // 내아이디
	      // System.out.println(userId); // 상대 아이디
	      
	      
	      Websocket websocket = new Websocket();
			
			websocket.setSender(myId);
			websocket.setReceiver(userId);
			
			
	      
	      
		
	      logger.info("{}로 부터 {} 받음", myId, message.getPayload());

	      for(WebSocketSession s : sessionList) {
		//	s.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
			s.sendMessage(new TextMessage(myId + " : " + message.getPayload()));
			
		}
	      websocket.setContent(message.getPayload());
	      websocket.setWebsocketsession(session.getId());
	      
	      
	      chatDao.chatinsert(websocket);
	      
	      
	      
	      
	      
	      
	}
	
	//클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
	}
	
}














