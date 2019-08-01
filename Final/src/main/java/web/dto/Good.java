package web.dto;

public class Good {
	
	private int good_no;
	private int member_code;
	private String member_id;
	private int good;
	private int content_no;
	@Override
	public String toString() {
		return "Good [good_no=" + good_no + ", member_code=" + member_code + ", member_id=" + member_id + ", good="
				+ good + ", content_no=" + content_no + "]";
	}
	public int getGood_no() {
		return good_no;
	}
	public void setGood_no(int good_no) {
		this.good_no = good_no;
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
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	
	
	
	
	
}
