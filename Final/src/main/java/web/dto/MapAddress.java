package web.dto;

public class MapAddress {
	
	private int addno;
	private String address;
	private String member_id;
	private String x;
	private String y;
	@Override
	public String toString() {
		return "MapAddress [addno=" + addno + ", address=" + address + ", member_id=" + member_id + ", x=" + x + ", y="
				+ y + "]";
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
