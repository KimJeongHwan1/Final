package web.dto;

public class Websocket {
	private String sender;
	private String receiver;
	private String websocketsession;
	private String content;
	@Override
	public String toString() {
		return "websocket [sender=" + sender + ", receiver=" + receiver + ", websocketsession=" + websocketsession
				+ ", content=" + content + "]";
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getWebsocketsession() {
		return websocketsession;
	}
	public void setWebsocketsession(String websocketsession) {
		this.websocketsession = websocketsession;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
