package web.dto;

import java.util.Date;

public class Userpage_cocomment {
	
//	    cocomment_no NUMBER PRIMARY KEY,
//	    content varchar2(4000),
//	    writtendate DATE DEFAULT sysdate,
//	    member_code number,
//	    member_id VARCHAR2(200) NOT NULL,
//	    comment_no NUMBER,
//	    page_no number
	
	private int cocomment_no;
	private String content;
	private Date writtendate;
	private int member_code;
	private String member_id;
	private int comment_no;
	@Override
	public String toString() {
		return "Userpage_cocoment [cocomment_no=" + cocomment_no + ", content=" + content + ", writtendate="
				+ writtendate + ", member_code=" + member_code + ", member_id=" + member_id + ", comment_no="
				+ comment_no + "]";
	}
	public int getCocomment_no() {
		return cocomment_no;
	}
	public void setCocomment_no(int cocomment_no) {
		this.cocomment_no = cocomment_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWrittendate() {
		return writtendate;
	}
	public void setWrittendate(Date writtendate) {
		this.writtendate = writtendate;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	
}
