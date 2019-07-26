package web.dto;

import java.util.Date;

public class Userpage_comment {

//    comment_no NUMBER PRIMARY KEY,
//    content varchar2(4000),
//    writtendate DATE DEFAULT sysdate,
//    member_code number,
//    page_no number

	private int comment_no;
	private String content;
	private Date writtendate;
	private int member_code;
	private String member_id;
	private int page_no;
	@Override
	public String toString() {
		return "Userpage_comment [comment_no=" + comment_no + ", content=" + content + ", writtendate=" + writtendate
				+ ", member_code=" + member_code + ", member_id=" + member_id + ", page_no=" + page_no + "]";
	}
	/**
	 * @return the comment_no
	 */
	public int getComment_no() {
		return comment_no;
	}
	/**
	 * @param comment_no the comment_no to set
	 */
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the writtendate
	 */
	public Date getWrittendate() {
		return writtendate;
	}
	/**
	 * @param writtendate the writtendate to set
	 */
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
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
	 * @return the page_no
	 */
	public int getPage_no() {
		return page_no;
	}
	/**
	 * @param page_no the page_no to set
	 */
	public void setPage_no(int page_no) {
		this.page_no = page_no;
	}
	
	
	
}
