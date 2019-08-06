package web.dao.face;

import java.util.List;

import web.dto.Good;
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

	public int joinCheckid(String member_id);

	public String pwCheckDao(String loginid);
	public void updatePwDao(Member member);
	public void memberdeleteDao(String member_id);
	
	public String IdFind(Member member);
	public String PwFind(Member member);
	
	public List<Member> getUserList(String loginid);
	
	public String getUserId(int member_code);
	
	
	// 좋아요 
	public int saveGoodBlock(Good good);
	public int saveGoodcount(int content_no);
	public void deleteGood(String member_id);
	public void saveGoodId(Good good);
	
	public void userpageGoodMin(int content_no);
	public void userpageGoodPls(int content_no);
	
	public List selectSearchHeader(String text);
//	public List selectSearchImgHeader(String text);
	
}
