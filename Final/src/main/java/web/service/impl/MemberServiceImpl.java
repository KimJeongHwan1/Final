package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.dto.UserImg;
import web.service.face.MemberService;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDao memberDao;

	@Override
	public Boolean login(Member member) {
		if (memberDao.selectCntLogin(member)>0) {
			return true;
		}
		return false;
	}

	@Override
	public Member selectMemberInfo(String loginid) {

		return memberDao.selectMemberInfoDao(loginid);
	}

	@Override
	public void updateInfo(Member member) {
		memberDao.updateInfoDao(member);

	}
	
	@Override
	public int getMember_code(String loginid) {
		return memberDao.getMember_codeDao(loginid);
	}
	
	@Override
	public void imgsave(MultipartFile file, ServletContext context, int member_code) {
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");

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
		UserImg userImg = new UserImg();
		userImg.setMember_code(member_code);
		userImg.setOriginname(file.getOriginalFilename());
		userImg.setStoredname(name);
		
		if (memberDao.checkImg(member_code)>0) {
			memberDao.deleteImg(member_code);
			memberDao.insertImg(userImg);
		} else {
			memberDao.insertImg(userImg);
		}
	}
	
	public boolean selectImgCheck(int member_code) {
		if (memberDao.checkImg(member_code)>0) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public UserImg selectImg(int member_code) {
		return memberDao.selectImgDao(member_code);
	}

	@Override
	public void join(Member member) {
		memberDao.insertLogin(member);

	}

	@Override
	public Member getMember(Member member) {
		return memberDao.selectByMember(member);
	}
	
	@Override
	public boolean idCheck(Member member) {
		
		if(memberDao.joinCheckid(member)>0){
			return true;
		}
		return false;
	}

}
