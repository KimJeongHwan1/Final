package web.webSocket;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

@Controller
public class webSocketController {

	@RequestMapping(value = "/socket/chat", method = RequestMethod.GET)
	public void test() {
		
		
		//String loginid = (String) session.getAttribute("loginid");
		
		// System.out.println(loginid);
		
		// System.out.println(websession.getAttributes());
		
		
	}
}