package web.dto;

public class Following {
//	following_code NUMBER primary key,
//	following_member VARCHAR(200), -- 회원
//	following_id VARCHAR(200), -- 회원을 팔로잉 하는 사람
//	following  NUMBER default 0); -- 팔로잉 여부
	
	private int following_code;
	private int following_member;
	private String following_id;
	private int following;
	
	@Override
	public String toString() {
		return "Following [following_code=" + following_code + ", following_member=" + following_member
				+ ", following_id=" + following_id + ", following=" + following + "]";
	}
	
	/**
	 * @return the following_code
	 */
	public int getFollowing_code() {
		return following_code;
	}
	/**
	 * @param following_code the following_code to set
	 */
	public void setFollowing_code(int following_code) {
		this.following_code = following_code;
	}
	/**
	 * @return the following_member
	 */
	public int getFollowing_member() {
		return following_member;
	}
	/**
	 * @param following_member the following_member to set
	 */
	public void setFollowing_member(int following_member) {
		this.following_member = following_member;
	}
	/**
	 * @return the following_id
	 */
	public String getFollowing_id() {
		return following_id;
	}
	/**
	 * @param following_id the following_id to set
	 */
	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}
	/**
	 * @return the following
	 */
	public int getFollowing() {
		return following;
	}
	/**
	 * @param following the following to set
	 */
	public void setFollowing(int following) {
		this.following = following;
	}
	
}
