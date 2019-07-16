package web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MemberDao;
import web.dto.Member;
import web.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired MemberDao memberDao;

	@Override
	public void join(Member member) {
		memberDao.insertLogin(member);

	}

	@Override
	public boolean login(Member memberData) {
		// 로그인 정보를 Count한 결과가 0보다 크면 로그인 성공
		if (memberDao.selectCntLogin(memberData) > 0) {
			return true;
		}

		return false;
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
