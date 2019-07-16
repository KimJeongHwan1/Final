package web.dao.face;

import web.dto.Member;
import web.dto.UserImg;

public interface MemberDao {
	
	public int selectCntLogin(Member member);
	public Member selectMemberInfoDao(String loginid);
	public int getMember_codeDao(String loginid);
	public void updateInfoDao(Member member);
	public void insertImg(UserImg userImg);
	public UserImg selectImgDao(int member_code);
	public int checkImg(int member_code);
	public void deleteImg(int member_code);
	
}
