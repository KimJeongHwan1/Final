package web.dao.face;

import web.dto.Member;

import web.dto.UserImg;

public interface MemberDao {
  
	public int getMember_codeDao(String loginid);
	public void updateInfoDao(Member member);
	public void insertImg(UserImg userImg);
	public UserImg selectImgDao(int member_code);
	public int checkImg(int member_code);
	public void deleteImg(int member_code);
	
	/**
	 * 	회원정보 삽입
	 * @param member	- 회원가입 정보
	 */
	public void insertLogin(Member member);
	
	/**
	 *  로그인 데이터와 일치하는 행 수를 조회한다
	 * @param member	login - id, pw를 가지는 객체
	 * @return		int - 조회된 행 수
	 */
	public int selectCntLogin(Member member);

	public Member selectByMember(Member member);

	public int joinCheckid(Member member);

	public String pwCheckDao(String loginid);
	public void updatePwDao(Member member);
	public void memberdeleteDao(String member_id);
}
