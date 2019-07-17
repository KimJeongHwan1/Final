package web.dto;

import java.util.Date;

public class BlackList {
	
	private int black_no;
	private String black_reporter;
	private String black_perpetrator;
	private String black_content;
	private Date black_report_date;
	private int member_code;
	@Override
	public String toString() {
		return "BlackList [black_no=" + black_no + ", black_reporter=" + black_reporter + ", black_perpetrator="
				+ black_perpetrator + ", black_content=" + black_content + ", black_report_date=" + black_report_date
				+ ", member_code=" + member_code + "]";
	}
	public int getBlack_no() {
		return black_no;
	}
	public void setBlack_no(int black_no) {
		this.black_no = black_no;
	}
	public String getBlack_reporter() {
		return black_reporter;
	}
	public void setBlack_reporter(String black_reporter) {
		this.black_reporter = black_reporter;
	}
	public String getBlack_perpetrator() {
		return black_perpetrator;
	}
	public void setBlack_perpetrator(String black_perpetrator) {
		this.black_perpetrator = black_perpetrator;
	}
	public String getBlack_content() {
		return black_content;
	}
	public void setBlack_content(String black_content) {
		this.black_content = black_content;
	}
	public Date getBlack_report_date() {
		return black_report_date;
	}
	public void setBlack_report_date(Date black_report_date) {
		this.black_report_date = black_report_date;
	}
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	
	
	
	
}
