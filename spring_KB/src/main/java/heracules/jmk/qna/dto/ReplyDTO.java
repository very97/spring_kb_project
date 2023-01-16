package heracules.jmk.qna.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private int qnaindex;
	private String rtitle;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	
	
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public int getQnaindex() {
		return qnaindex;
	}
	public void setQnaindex(int qnaindex) {
		this.qnaindex = qnaindex;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyDTO [qnaindex=" + qnaindex + ", rtitle=" + rtitle + ", rno=" + rno + ", content=" + content
				+ ", writer=" + writer + ", regdate=" + regdate + "]";
	}
	
	
	
}
