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
	
	@Override
	public String toString() {
		return "UserPage [content_no=" + content_no + ", content_title=" + content_title + ", content=" + content
				+ ", member_code=" + member_code + ", hit=" + hit + ", good=" + good + ", write_date=" + write_date
				+ ", tag=" + tag + ", file_index=" + file_index + ", originname=" + originname + ", storedname="
				+ storedname + ", blockSee=" + blockSee + ", comm_count=" + comm_count + "]";
	}
	/**
	 * @return the content_no
	 */
	public int getContent_no() {
		return content_no;
	}
	/**
	 * @param content_no the content_no to set
	 */
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	/**
	 * @return the content_title
	 */
	public String getContent_title() {
		return content_title;
	}
	/**
	 * @param content_title the content_title to set
	 */
	public void setContent_title(String content_title) {
		this.content_title = content_title;
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
	 * @return the hit
	 */
	public int getHit() {
		return hit;
	}
	/**
	 * @param hit the hit to set
	 */
	public void setHit(int hit) {
		this.hit = hit;
	}
	/**
	 * @return the good
	 */
	public int getGood() {
		return good;
	}
	/**
	 * @param good the good to set
	 */
	public void setGood(int good) {
		this.good = good;
	}
	/**
	 * @return the write_date
	 */
	public Date getWrite_date() {
		return write_date;
	}
	/**
	 * @param write_date the write_date to set
	 */
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	/**
	 * @return the tag
	 */
	public String getTag() {
		return tag;
	}
	/**
	 * @param tag the tag to set
	 */
	public void setTag(String tag) {
		this.tag = tag;
	}
	/**
	 * @return the file_index
	 */
	public int getFile_index() {
		return file_index;
	}
	/**
	 * @param file_index the file_index to set
	 */
	public void setFile_index(int file_index) {
		this.file_index = file_index;
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
	/**
	 * @return the blockSee
	 */
	public int getBlockSee() {
		return blockSee;
	}
	/**
	 * @param blockSee the blockSee to set
	 */
	public void setBlockSee(int blockSee) {
		this.blockSee = blockSee;
	}
	/**
	 * @return the comm_count
	 */
	public int getComm_count() {
		return comm_count;
	}
	/**
	 * @param comm_count the comm_count to set
	 */
	public void setComm_count(int comm_count) {
		this.comm_count = comm_count;
	}
	
	
}
