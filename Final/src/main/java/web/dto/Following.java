package web.dto;

public class Following {
//	fwg_code NUMBER primary key,
//	fwg_user_id VARCHAR(200), -- 회원
//	fwg_user_code VARCHAR(200), -- 회원코드
//	fwg_you_id VARCHAR(200), -- 회원을 팔로잉 하는 사람
//	fwg_you_code VARCHAR(200) -- 회원을 팔로잉 하는 사람코드
	
	private int fwg_code;
	private String fwg_user_id;
	private int fwg_user_code;
	private String fwg_you_id;
	private int fwg_you_code;
	@Override
	public String toString() {
		return "Following [fwg_code=" + fwg_code + ", fwg_user_id=" + fwg_user_id + ", fwg_user_code=" + fwg_user_code
				+ ", fwg_you_id=" + fwg_you_id + ", fwg_you_code=" + fwg_you_code + "]";
	}
	/**
	 * @return the fwg_code
	 */
	public int getFwg_code() {
		return fwg_code;
	}
	/**
	 * @param fwg_code the fwg_code to set
	 */
	public void setFwg_code(int fwg_code) {
		this.fwg_code = fwg_code;
	}
	/**
	 * @return the fwg_user_id
	 */
	public String getFwg_user_id() {
		return fwg_user_id;
	}
	/**
	 * @param fwg_user_id the fwg_user_id to set
	 */
	public void setFwg_user_id(String fwg_user_id) {
		this.fwg_user_id = fwg_user_id;
	}
	/**
	 * @return the fwg_user_code
	 */
	public int getFwg_user_code() {
		return fwg_user_code;
	}
	/**
	 * @param fwg_user_code the fwg_user_code to set
	 */
	public void setFwg_user_code(int fwg_user_code) {
		this.fwg_user_code = fwg_user_code;
	}
	/**
	 * @return the fwg_you_id
	 */
	public String getFwg_you_id() {
		return fwg_you_id;
	}
	/**
	 * @param fwg_you_id the fwg_you_id to set
	 */
	public void setFwg_you_id(String fwg_you_id) {
		this.fwg_you_id = fwg_you_id;
	}
	/**
	 * @return the fwg_you_code
	 */
	public int getFwg_you_code() {
		return fwg_you_code;
	}
	/**
	 * @param fwg_you_code the fwg_you_code to set
	 */
	public void setFwg_you_code(int fwg_you_code) {
		this.fwg_you_code = fwg_you_code;
	}
	
}
