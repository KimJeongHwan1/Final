package web.dto;

public class Follower {
//	fwr_code NUMBER primary key,
//	fwr_my_id VARCHAR(200), -- 회원
//	fwr_my_code VARCHAR(200), -- 회원코드
//	fwr_user_id VARCHAR(200), -- 회원을 팔로워 하는 사람
//	fwr_user_code VARCHAR(200) -- 회원을 팔로워 하는 사람코드
	
	private int fwr_code;
	private String fwr_my_id;
	private int fwr_my_code;
	private String fwr_user_id;
	private int fwr_user_code;
	@Override
	public String toString() {
		return "Follower [fwr_code=" + fwr_code + ", fwr_my_id=" + fwr_my_id + ", fwr_my_code=" + fwr_my_code
				+ ", fwr_user_id=" + fwr_user_id + ", fwr_user_code=" + fwr_user_code + "]";
	}
	/**
	 * @return the fwr_code
	 */
	public int getFwr_code() {
		return fwr_code;
	}
	/**
	 * @param fwr_code the fwr_code to set
	 */
	public void setFwr_code(int fwr_code) {
		this.fwr_code = fwr_code;
	}
	/**
	 * @return the fwr_my_id
	 */
	public String getFwr_my_id() {
		return fwr_my_id;
	}
	/**
	 * @param fwr_my_id the fwr_my_id to set
	 */
	public void setFwr_my_id(String fwr_my_id) {
		this.fwr_my_id = fwr_my_id;
	}
	/**
	 * @return the fwr_my_code
	 */
	public int getFwr_my_code() {
		return fwr_my_code;
	}
	/**
	 * @param fwr_my_code the fwr_my_code to set
	 */
	public void setFwr_my_code(int fwr_my_code) {
		this.fwr_my_code = fwr_my_code;
	}
	/**
	 * @return the fwr_user_id
	 */
	public String getFwr_user_id() {
		return fwr_user_id;
	}
	/**
	 * @param fwr_user_id the fwr_user_id to set
	 */
	public void setFwr_user_id(String fwr_user_id) {
		this.fwr_user_id = fwr_user_id;
	}
	/**
	 * @return the fwr_user_code
	 */
	public int getFwr_user_code() {
		return fwr_user_code;
	}
	/**
	 * @param fwr_user_code the fwr_user_code to set
	 */
	public void setFwr_user_code(int fwr_user_code) {
		this.fwr_user_code = fwr_user_code;
	}
	
}
