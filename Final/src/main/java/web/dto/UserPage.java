package web.dto;

import java.util.Date;

public class UserPage {

	private int content_no;
	private String content_title; 
	private String content;
	private int member_code;
	private int hit;
	private int good;
	private Date write_date;
	private String tag;
	private int file_index;
	private String originname; 
	private String storedname;
	private int blockSee;
	private int comm_count;

	private int addno;
	private String address;
	private String x;
	private String y;

	
	@Override
	public String toString() {
		return "UserPage [content_no=" + content_no + ", content_title=" + content_title + ", content=" + content
				+ ", member_code=" + member_code + ", hit=" + hit + ", good=" + good + ", write_date=" + write_date
				+ ", tag=" + tag + ", file_index=" + file_index + ", originname=" + originname + ", storedname="

				+ storedname + ", blockSee=" + blockSee + ", comm_count=" + comm_count + ", addno=" + addno
				+ ", address=" + address + ", x=" + x + ", y=" + y + "]";
	}

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public String getContent_title() {
		return content_title;
	}

	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getMember_code() {
		return member_code;
	}

	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getFile_index() {
		return file_index;
	}

	public void setFile_index(int file_index) {
		this.file_index = file_index;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getStoredname() {
		return storedname;
	}

	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}

	public int getBlockSee() {
		return blockSee;
	}

	public void setBlockSee(int blockSee) {
		this.blockSee = blockSee;
	}

	public int getComm_count() {
		return comm_count;
	}

	public void setComm_count(int comm_count) {
		this.comm_count = comm_count;
	}

	public int getAddno() {
		return addno;
	}

	public void setAddno(int addno) {
		this.addno = addno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	


}
