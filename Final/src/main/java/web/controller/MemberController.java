package web.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import web.dto.Member;
import web.dto.UserImg;
import web.service.face.MemberService;
import web.service.face.MyPageService;
import web.service.face.TongService;
import web.service.face.UserPageService;

@Controller
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBo naverLoginBO;
	private String apiResult = null;

	// 카카오
	private kakao_restapi kakao_restapi = new kakao_restapi();

	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}


	//로그 라이브러리 객체
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);

	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	@Autowired MyPageService mypageService;
	@Autowired UserPageService userpageService;
	@Autowired TongService tongService;

	// 네이버로 로그인 했을 때
	@RequestMapping(value="/member/main", method=RequestMethod.GET)
	public String NaverLogin(Model model, 
			@RequestParam String code, @RequestParam String state, HttpSession session)
					throws IOException, ParseException { 
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터


		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱

		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		String id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");		

		System.out.println(nickname);
		System.out.println(id);
		System.out.println(email);
		

		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("login", true);
		session.setAttribute("loginid", id);
		session.setAttribute("email", email);
		session.setAttribute("nickname",nickname); //세션 생성
		model.addAttribute("result", apiResult);
		
		return "redirect:"+"/member/main2";
	}

	// 일반 로그인 했을때
	@RequestMapping(value = "/member/main2", method = RequestMethod.GET) 
	public void main2(HttpSession session, Model model , Member member) { 
		
		String loginid = (String) session.getAttribute("loginid");
		
		List<Member> list = memberService.getUseridList(loginid);
		
		model.addAttribute("list", list);
		
		// 헤더 import문제로 코드추가
		member.setMember_id(loginid);
		member = memberService.getMember(member);	
		model.addAttribute("mem", member);
		
	}

	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc(Member member) {

		memberService.join(member); //회원가입 처리
		logger.info("회원가입 : " + member.toString() ) ;
		
		return "redirect:/member/login"; //main2페이지로 리다이렉트

	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join(Member member, Model model, HttpSession session) { 
		logger.info("회원가입 폼");
		
	}
	
	@RequestMapping(value="/member/idCheck", method=RequestMethod.GET)
	public String idCheck(String member_id, Model model) {

		logger.info("아이디 : "+ member_id);
		int check = 0;
		if(member_id.equals("")){
			check = 0;
		} else if(memberService.idCheck(member_id)) {
			check = 0;
		} else {
			check = 1;
		}
		model.addAttribute("check", check);
		return "member/joincheck";
	}

	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login(Model model, HttpSession session) {
		logger.info("로그인 폼");

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125

		// System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);


	}

	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginProc(
			Member member, //로그인 정보 커맨드 객체
			HttpSession session//세션 객체
			) {
		logger.info("로그인 처리");
		logger.info(member.toString());

		String redirectUrl = null;
		if( memberService.login(member) ) {
			//로그인 성공

			//id 로 member 조회
			member = memberService.getMember(member);

			//세션 정보 저장
			session.setAttribute("login", true);
			session.setAttribute("loginid", member.getMember_id());
			session.setAttribute("nick", member.getMember_name());
			session.setMaxInactiveInterval(60 * 60);

			//리다이렉트 URL 지정
			redirectUrl = "/tong/timeLinePage";

		} else {
			//로그인 실패
			//리다이렉트 URL 지정
			redirectUrl = "/member/login";

		}

		return "redirect:" + redirectUrl;
	}

	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:" + "/member/login";
	}

	@RequestMapping(value="/member/updateInfo", method=RequestMethod.GET)
	public void updateInfo(HttpSession session, Model model, Member member) {

		String loginid = (String)session.getAttribute("loginid");
		logger.info(loginid);

		member.setMember_id(loginid);

		member = memberService.getMember(member);
		logger.info(member.toString());

		model.addAttribute("member", member);

		int member_code = memberService.getMember_code(loginid);

		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
		
		// 헤더 import문제로 코드추가
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
	}

	@RequestMapping(value="/member/updateInfo", method=RequestMethod.POST)
	public String updateInfoProc(
			Member member,
			@RequestParam(value="file")MultipartFile fileupload, HttpSession session) {

		String loginid = (String)session.getAttribute("loginid");
		logger.info(member.toString());
		logger.info(fileupload.getOriginalFilename());

		int member_code = memberService.getMember_code(loginid);
		member.setMember_id(loginid);
		memberService.updateInfo(member);
		if(fileupload.getOriginalFilename().equals("")) {

		} else {
			memberService.imgsave(fileupload, context, member_code);
		}
		return "redirect:"+"/member/updateInfo";

	}



	@RequestMapping(value="/member/updatePw", method=RequestMethod.GET)
	public void updatePw(HttpSession session, Model model, Member member) {

		String loginid = (String)session.getAttribute("loginid");

		int member_code = memberService.getMember_code(loginid);

		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
		
		// 헤더 import문제로 코드추가
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
	}

	@RequestMapping(value="/member/pwChange", method=RequestMethod.GET)
	public void pwChange(HttpSession session, Model model, String member_pw0, String member_pw1, String member_pw2) {

		String loginid = (String) session.getAttribute("loginid");

		String loginpw = memberService.pwCheck(loginid);

		int num = 0;

		if((loginpw.equals(member_pw0)) && (member_pw1.equals(member_pw2))) {
			if(member_pw0.equals(member_pw1)) {
				num = 0; //변경 성공		
			} 
		} else if((loginpw.equals(member_pw0)) && (!member_pw1.equals(member_pw2))) {
			num = 2; //새 새확인 불일치
		} else if((member_pw1.equals(member_pw2)) && (!loginpw.equals(member_pw0))) {
			num = 3; //로그인 이전 불일치
		} else {
			num = 4; //이전 새 새확인 불일치
		}

		if(num == 0) {
			memberService.updatePw(member_pw1, loginid);
		}
		model.addAttribute("result", num);
	}


	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public void delete(HttpSession session, Model model, Member member) {
		String loginid = (String) session.getAttribute("loginid");

		String loginpw = memberService.pwCheck(loginid);
		model.addAttribute("logpw", loginpw);
		
		// 헤더 import문제로 코드추가
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
	}

	@RequestMapping(value="/member/resultdelete", method=RequestMethod.POST)
	public String resultdelete(HttpSession session, Model model, String pw) {
		String loginid = (String) session.getAttribute("loginid");

		String loginpw = memberService.pwCheck(loginid);
		int member_code = memberService.getMember_code(loginid);
		String url = "member/delete";
		if(loginpw.equals(pw)) {
			memberService.memberdelete(loginid, member_code);
			session.invalidate();
			url = "member/resultdelete";
		} 
		return url;
	}


	@RequestMapping(value="/member/findIdPw", method=RequestMethod.GET)
	public void findIdPw() {

	}

	@RequestMapping(value="/member/findSuccessId", method=RequestMethod.GET)
	public String findSuccessId(String id_name, String id_email, Model model) {

		if(!(id_name).equals("") && !(id_email).equals("")) {

			String id = memberService.findId(id_name, id_email);

			logger.info("찾은 ID : " + id);

			model.addAttribute("id", id);
		} 

		return "/member/findSuccessId";

	}

	@RequestMapping(value="/member/findSuccessPw", method=RequestMethod.GET)
	public String findSuccessPw(String pw_name, String pw_id, String pw_email, Model model) {

		if(!(pw_name).equals("") && !(pw_id).equals("") && !(pw_email).equals("")) {

			String pw = memberService.findPw(pw_name, pw_id, pw_email);

			logger.info("찾은 PW : " + pw);

			model.addAttribute("pw", pw);
		}

		return "/member/findSuccessPw";

	}

	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public void mypage(HttpSession session, Model model, Member member ) {

		String loginid = (String)session.getAttribute("loginid");
		//logger.info(loginid);
		
		member.setMember_id(loginid);

		member = memberService.getMember(member);
		//logger.info(member.toString());

		model.addAttribute("member", member);

		int member_code = memberService.getMember_code(loginid);

		if(memberService.selectImgCheck(member_code)) {
			UserImg userImg = memberService.selectImg(member_code);
			//logger.info(userImg.toString());
			model.addAttribute("img", userImg);
		} 

		model.addAttribute("bool", memberService.selectImgCheck(member_code));
		
		int following = tongService.following_Cnt(loginid) ;
		model.addAttribute( "following" , following ) ;
		
		int follower = tongService.follower_Cnt(loginid) ;
		model.addAttribute( "follower" , follower ) ;
		
		int comment = tongService.comment_Cnt(loginid) ;
		model.addAttribute( "comment" , comment ) ;
		
		int list = tongService.list_Cnt(member_code) ;
		model.addAttribute( "list" , list ) ;
		
		int favorite = tongService.favorite_Cnt(loginid);
		model.addAttribute( "favorite" , favorite ) ;
		
		// 헤더 import문제로 코드추가
		member.setMember_id(loginid);
	    member = memberService.getMember(member);   
	    model.addAttribute("mem", member);
		
		
	}	


	// 카카오 로그인
	@RequestMapping(value = "/member/main3", produces = "application/json", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
		System.out.println("로그인 할때 임시 코드값");
		//카카오 홈페이지에서 받은 결과 코드
		System.out.println(code);
		System.out.println("로그인 후 결과값");

		//카카오 rest api 객체 선언
		kakao_restapi kr = new kakao_restapi();
		//결과값을 node에 담아줌
		JsonNode node = kr.getAccessToken(code);
		//결과값 출력
		System.out.println(node);
		//노드 안에 있는 access_token값을 꺼내 문자열로 변환
		String token = node.get("access_token").toString();

		//세션에 담아준다.
		session.setAttribute("loginid", token);
		session.setAttribute("loginKakao", true);
		return "redirect:"+"/member/main2";
	}

	
	// 카카오 로그아웃
	@RequestMapping(value = "/kakao/logout", produces = "application/json", method=RequestMethod.GET)
	public String Logout(HttpSession session) {
		//kakao restapi 객체 선언
		kakao_restapi kr = new kakao_restapi();
		//노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
		JsonNode node = kr.Logout(session.getAttribute("loginid").toString());

		//결과 값 출력
		System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));

		return "redirect:/member/login";
	}   






}
