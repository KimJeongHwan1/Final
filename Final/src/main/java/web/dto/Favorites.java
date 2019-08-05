package web.dto;

public class Favorites {
//	fav_no NUMBER primary key,
//	content_no NUMBER,
//	member_id VARCHAR2(200)
	
	private int fav_no;
	private int content_no;
	private String member_id;
	
	@Override
	public String toString() {
		return "Favorits [fav_no=" + fav_no + ", content_no=" + content_no + ", member_id=" + member_id + "]";
	}
	public int getFav_no() {
		return fav_no;
	}
	public void setFav_no(int fav_no) {
		this.fav_no = fav_no;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
	
}
