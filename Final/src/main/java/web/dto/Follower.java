package web.dto;

public class Follower {
//	follower_code NUMBER primary key,
//	follower_member VARCHAR(200), --회원 
//	follower_id VARCHAR(200), -- 회원을 팔로워 하는 사람
//	follower  NUMBER default 0 -- 팔로워 여부
	
	private int follower_code;
	private int follower_member;
	private String follower_id;
	private int follower;
	@Override
	public String toString() {
		return "Follower [follower_code=" + follower_code + ", follower_member=" + follower_member + ", follower_id="
				+ follower_id + ", follower=" + follower + "]";
	}
	/**
	 * @return the follower_code
	 */
	public int getFollower_code() {
		return follower_code;
	}
	/**
	 * @param follower_code the follower_code to set
	 */
	public void setFollower_code(int follower_code) {
		this.follower_code = follower_code;
	}
	/**
	 * @return the follower_member
	 */
	public int getFollower_member() {
		return follower_member;
	}
	/**
	 * @param follower_member the follower_member to set
	 */
	public void setFollower_member(int follower_member) {
		this.follower_member = follower_member;
	}
	/**
	 * @return the follower_id
	 */
	public String getFollower_id() {
		return follower_id;
	}
	/**
	 * @param follower_id the follower_id to set
	 */
	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}
	/**
	 * @return the follower
	 */
	public int getFollower() {
		return follower;
	}
	/**
	 * @param follower the follower to set
	 */
	public void setFollower(int follower) {
		this.follower = follower;
	}
	
}
