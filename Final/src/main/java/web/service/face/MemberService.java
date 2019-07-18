package web.service.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Member;
import web.dto.UserImg;


public interface MemberService {
	
	
	public Boolean login(Member member);
	public void updateInfo(Member member);
	public int getMember_code(String loginid);
	public void imgsave(MultipartFile file, ServletContext context, int member_code);
	public boolean selectImgCheck(int member_code);
	public UserImg selectImg(int member_code);
	
	/**
	 * 회원가입
	 * 
	 * @param login - 회원가입 정보
	 */
	public void join(Member member);

	/**
	 * 로그인 정보 처리 메소드
	 * 
	 * @param loginData - 존재하는 사용자인지 확인할 데이터
	 * @return boolean - 로그인 성공/실패
	 */
	public Member getMember(Member member);

	public boolean idCheck(Member member);
	
	public String pwCheck(String loginid);
	public void updatePw(String member_pw, String loginid);
	public void memberdelete(String member_id, int member_code);
	
	public String findId(String member_name, String member_email);
	public String findPw(String member_name, String member_id, String member_email);
	
}
