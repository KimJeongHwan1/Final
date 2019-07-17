package web.dto;

public class UserImg {
//	fileno NUMBER PRIMARY KEY,
//  member_code NUMBER,
//  originname VARCHAR2(300),
//  storedname VARCHAR2(300)
	
	private int fileno;
	private int member_code;
	private String originname;
	private String storedname;
	
	@Override
	public String toString() {
		return "UserImg [fileno=" + fileno + ", member_code=" + member_code + ", originname=" + originname
				+ ", storedname=" + storedname + "]";
	}
	/**
	 * @return the fileno
	 */
	public int getFileno() {
		return fileno;
	}
	/**
	 * @param fileno the fileno to set
	 */
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	/**
	 * @return the member_code
	 */
	public int getMember_code() {
		return member_code;
	}
	/**
	 * @param member_code the member_code to set
	 */
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	/**
	 * @return the originname
	 */
	public String getOriginname() {
		return originname;
	}
	/**
	 * @param originname the originname to set
	 */
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	/**
	 * @return the storedname
	 */
	public String getStoredname() {
		return storedname;
	}
	/**
	 * @param storedname the storedname to set
	 */
	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}
	

}
