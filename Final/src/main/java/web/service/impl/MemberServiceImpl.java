package web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.MemberDao;
import web.dto.Good;
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
	public boolean idCheck(String member_id) {
		
		if(memberDao.joinCheckid(member_id)>0){
			return true;
		}
		return false;
	}
	
	@Override
	public String pwCheck(String loginid) {
		return memberDao.pwCheckDao(loginid);
	}

	@Override
	public void updatePw(String member_pw, String loginid) {
		System.out.println(member_pw);
		System.out.println(loginid);
		
		Member member = new Member();
		member.setMember_id(loginid);
		member.setMember_pw(member_pw);
		memberDao.updatePwDao(member);
	}

	@Override
	public void memberdelete(String member_id, int member_code) {
		memberDao.deleteImg(member_code);
		memberDao.memberdeleteDao(member_id);
		
	}

	@Override
	public String findId(String member_name, String member_email) {
		Member member = new Member();
		member.setMember_name(member_name);
		member.setMember_email(member_email);
		
		return memberDao.IdFind(member);
	}

	@Override
	public String findPw(String member_name, String member_id, String member_email) {
		Member member = new Member();
		member.setMember_name(member_name);
		member.setMember_id(member_id);
		member.setMember_email(member_email);
		
		return memberDao.PwFind(member);
	}
	
	@Override
	public List<Member> getUseridList(String loginid) {
		// TODO Auto-generated method stub
		return memberDao.getUserList(loginid);
	}

	@Override
	public String getmember_id(int member_code) {
		// TODO Auto-generated method stub
		return memberDao.getUserId(member_code);
	}

	@Override
	public void saveGoodId(String member_id, int content_no) {
		
		Good good = new Good();
		
		good.setContent_no(content_no);
		good.setMember_id(member_id);
		
		if(memberDao.saveGoodBlock(good)>0) {
			
			memberDao.deleteGood(member_id);
			System.out.println("ㅎㅇ");
			
		} else {
			
			System.out.println(good);
			memberDao.saveGoodId(good);
		}
		
	}

	@Override
	public int saveGoodCount(int content_no) {
		return memberDao.saveGoodcount(content_no);
	}

	@Override
	public int goodCheck(Good good) {
		return memberDao.saveGoodBlock(good);
	}
}
