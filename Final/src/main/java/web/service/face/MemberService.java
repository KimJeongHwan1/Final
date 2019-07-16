package web.service.face;

import web.dto.Member;

public interface MemberService {
	
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
	public boolean login(Member member);

	public Member getMember(Member member);

	public boolean idCheck(Member member);

}
