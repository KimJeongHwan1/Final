package web.service.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Member;
import web.dto.UserImg;


public interface MemberService {
	
	
	public Boolean login(Member member);
	public Member selectMemberInfo(String loginid);
	public void updateInfo(Member member);
	public int getMember_code(String loginid);
	public void imgsave(MultipartFile file, ServletContext context, int member_code);
	public boolean selectImgCheck(int member_code);
	public UserImg selectImg(int member_code);
}