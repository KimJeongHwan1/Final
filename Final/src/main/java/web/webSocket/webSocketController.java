package web.webSocket;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.WebSocketSession;

import web.dao.face.ChatDao;
import web.dto.Member;
import web.dto.Websocket;

@Controller
public class webSocketController {

	@Autowired ChatDao chatDao;
	
	
	@RequestMapping(value = "/socket/chat", method = RequestMethod.GET)
	public void test(String userid, HttpSession session, Model model) {
		
		
				System.out.println(userid + "상대방입니다"); // 채팅 상대
				session.setAttribute("userid", userid);
				
				
				String myid = (String) session.getAttribute("loginid");
				model.addAttribute("myid", myid);
				System.out.println(myid + "내아이디입니다"); // 내 아이디
				
				
				model.addAttribute("userid", userid);
				
				Websocket websocket = new Websocket();
				
				websocket.setSender(myid);
				websocket.setReceiver(userid);
				
				
				
				// 
				List view = chatDao.view(websocket);
				
				model.addAttribute("view", view);
				
				System.out.println(view.toString());
				
				
				
				
	}
}