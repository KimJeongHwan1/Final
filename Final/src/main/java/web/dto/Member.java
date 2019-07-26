package web.dto;
import java.util.Date;


import java.util.Date;

public class Member {
//  member_code NUMBER PRIMARY KEY,
//  member_id VARCHAR2(200) NOT NULL,
//  member_pw VARCHAR2(200) NOT NULL,
//  member_name VARCHAR2(200) NOT NULL,
//  member_gender VARCHAR2(30) NOT NULL,
//  member_birth DATE NOT NULL,
//  member_email VARCHAR2(200) NOT NULL,
//  member_phone VARCHAR2(200) NOT NULL,
//	member_addressNum VARCHAR2(500) NOT NULL , 
//  member_address VARCHAR2(500) NOT NULL , 
//  member_type NUMBER not null

	private int member_code;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_gender;
	private Date member_birth;	
	private String member_email;
	private String member_phone;
	private String member_addressnum;
	private String member_address;	
	private int member_type;
	@Override
	public String toString() {
		return "Member [member_code=" + member_code + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_gender=" + member_gender + ", member_birth=" + member_birth
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_addressnum="
				+ member_addressnum + ", member_address=" + member_address + ", member_type=" + member_type + "]";
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
	 * @return the member_id
	 */
	public String getMember_id() {
		return member_id;
	}
	/**
	 * @param member_id the member_id to set
	 */
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	/**
	 * @return the member_pw
	 */
	public String getMember_pw() {
		return member_pw;
	}
	/**
	 * @param member_pw the member_pw to set
	 */
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	/**
	 * @return the member_name
	 */
	public String getMember_name() {
		return member_name;
	}
	/**
	 * @param member_name the member_name to set
	 */
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	/**
	 * @return the member_gender
	 */
	public String getMember_gender() {
		return member_gender;
	}
	/**
	 * @param member_gender the member_gender to set
	 */
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	/**
	 * @return the member_birth
	 */
	public Date getMember_birth() {
		return member_birth;
	}
	/**
	 * @param member_birth the member_birth to set
	 */
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	/**
	 * @return the member_email
	 */
	public String getMember_email() {
		return member_email;
	}
	/**
	 * @param member_email the member_email to set
	 */
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	/**
	 * @return the member_phone
	 */
	public String getMember_phone() {
		return member_phone;
	}
	/**
	 * @param member_phone the member_phone to set
	 */
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	/**
	 * @return the member_addressnum
	 */
	public String getMember_addressnum() {
		return member_addressnum;
	}
	/**
	 * @param member_addressnum the member_addressnum to set
	 */
	public void setMember_addressnum(String member_addressnum) {
		this.member_addressnum = member_addressnum;
	}
	/**
	 * @return the member_address
	 */
	public String getMember_address() {
		return member_address;
	}
	/**
	 * @param member_address the member_address to set
	 */
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	/**
	 * @return the member_type
	 */
	public int getMember_type() {
		return member_type;
	}
	/**
	 * @param member_type the member_type to set
	 */
	public void setMember_type(int member_type) {
		this.member_type = member_type;
	}
}
