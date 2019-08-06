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
import web.dto.Favorites;
import web.dto.Following;
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
		
		userpageDao.hit(userpage);
		
		return userpageDao.selectByContentno(userpage);
	}
	@Override
	public void insertComment(Userpage_comment userComm) {
		userpageDao.insertCommentDao(userComm);
		userpageDao.insertCommentCountDao(userComm.getPage_no());
		
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
	
	@Override
	public void deletecomment(Userpage_comment comment) {
		userpageDao.deleteCommentDao(comment);
		
		userpageDao.deleteCommentCountDao(comment.getPage_no());
	}
	@Override
	public void deletecoComment(int cocomment_no) {
		userpageDao.deletecoCommentDao(cocomment_no);
		
	}
	@Override
	public List selectTag(String tag) {
		// TODO Auto-generated method stub
		return userpageDao.selectTagDao(tag);
	}
	@Override
	public List headerSearchUserpage(String text) {
		// TODO Auto-generated method stub
		return userpageDao.selectSearchHeader(text);
	}
	@Override
	public void Following(Following fwg) {
		
		if(userpageDao.followingCheck(fwg)>0) {
			userpageDao.deleteFollowingDao(fwg);
		} else {
			userpageDao.insertFollowingDao(fwg);
		}
		
		
	}
	@Override
	public int checkFollowing(Following fwg) {
		// TODO Auto-generated method stub
		return userpageDao.followingCheck(fwg);
	}
	
	@Override
	public List<UserPage> getbestlist(Member member) {
		return userpageDao.bestList(member) ;
	}
	@Override
	public void favorites(Favorites fav) {
		if(userpageDao.favoritesCheck(fav)>0) {
			userpageDao.deletefavoritesDao(fav);
		} else {
			userpageDao.insertfavoritesDao(fav);
		}
		
	}
	@Override
	public int checkfavorites(Favorites fav) {
		// TODO Auto-generated method stub
		return userpageDao.favoritesCheck(fav);
	}

	@Override
	public void imgupdate(MultipartFile file, ServletContext context, UserPage userpage) {
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
				
				userpageDao.updateImg(userpage);
		
	}
	@Override
	public void updatewrite(UserPage userPage) {
		userpageDao.updatewriteInfo(userPage);
		

	
	@Override
	public UserPage selectByContent_no(int content_no) {
		// TODO Auto-generated method stub
		return userpageDao.userpageSelectByContent_no(content_no);

	}
}
