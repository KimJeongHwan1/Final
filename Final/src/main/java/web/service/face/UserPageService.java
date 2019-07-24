package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Member;
import web.dto.UserPage;
import web.dto.Userpage_comment;

public interface UserPageService {
	public void imgsave(MultipartFile file, ServletContext context, UserPage userpage);
	public void insertwrite(UserPage userPage);
	
	public List<UserPage> getwriteList(Member member);
	
	public UserPage selectUserpage(UserPage userpage);
	
	public void insertComment(Userpage_comment userComm);
	
	public List selectComment(int page_no);
}
