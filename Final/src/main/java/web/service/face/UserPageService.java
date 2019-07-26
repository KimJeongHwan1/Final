package web.service.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.Member;
import web.dto.UserImg;
import web.dto.UserPage;
import web.dto.Userpage_cocomment;
import web.dto.Userpage_comment;

public interface UserPageService {
	public void imgsave(MultipartFile file, ServletContext context, UserPage userpage);
	public void insertwrite(UserPage userPage);
	
	public List<UserPage> getwriteList(Member member);
	
	public UserPage selectUserpage(UserPage userpage);
	
	public void insertComment(Userpage_comment userComm);
	
	public List<Userpage_comment> selectComment(int page_no);
	
	public List<UserImg> selectUserImgAll();
	
	public void insertCocomment(Userpage_cocomment cocoment);
	
	public List<Userpage_cocomment> selectcocoment(int cocoment);
	
	public List<Userpage_cocomment> selectcocomentAll();
}
