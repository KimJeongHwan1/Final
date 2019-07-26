package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.UserPageDao;
import web.dto.Member;
import web.dto.UserImg;
import web.dto.UserPage;
import web.dto.Userpage_cocomment;
import web.dto.Userpage_comment;
import web.service.face.UserPageService;

@Service
public class UserPageServiceImpl  implements UserPageService{
	@Autowired UserPageDao userpageDao;
	@Override
	public void imgsave(MultipartFile file, ServletContext context, UserPage userpage) {
		//파일이 저장될 경로
		String storedPath = context.getRealPath("uppage");

		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];

		//저장될 파일의 이름( 원본이름 + UUID)
		String name = file.getOriginalFilename()+"_"+uId;

		//저장될 파일 객체
		File dest = new File(storedPath, name);

		//파일저장
		try {
			file.transferTo(dest); //실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();

		} catch (IOException e) {
			e.printStackTrace();

		}

		//DB에 저장(업로드 정보 기록)
		userpage.setOriginname(file.getOriginalFilename());
		userpage.setStoredname(name);
		
		userpageDao.insertImg(userpage);
	}
	@Override
	public void insertwrite(UserPage userPage) {
		userpageDao.insertwriteInfo(userPage);
		
	}
	@Override
	public List<UserPage> getwriteList(Member member) {
		return userpageDao.getwriteListDao(member);
	}
	@Override
	public UserPage selectUserpage(UserPage userpage) {
		
		return userpageDao.selectByContentno(userpage);
	}
	@Override
	public void insertComment(Userpage_comment userComm) {
		userpageDao.insertCommentDao(userComm);
		
	}
	@Override
	public List<Userpage_comment> selectComment(int page_no) {
		
		return userpageDao.selectCommentDao(page_no);
	}
	@Override
	public List<UserImg> selectUserImgAll() {
		return userpageDao.selectUserImgAllDao();
		
	}
	@Override
	public void insertCocomment(Userpage_cocomment cocoment) {
		
		userpageDao.insertCocommentDao(cocoment);
		
	}
	@Override
	public List<Userpage_cocomment> selectcocoment(int cocoment) {
		return userpageDao.selectcocomentDao(cocoment);
	}
	
	public List<Userpage_cocomment> selectcocomentAll() {
		return userpageDao.selectcocomentAllDao();
	}
}
