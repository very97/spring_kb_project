package heracules.jmk.qna.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;


@Component
public class QnaDTO {

	private int qnaindex;
	private String qnatitle;
	private String qnacontents;
	private Date qnadate;
	
	public Date getQnadate() {
		return qnadate;
	}
	public void setQnadate(Date qnadate) {
		this.qnadate = qnadate;
	}
	public int getQnaindex() {
		return qnaindex;
	}
	public void setQnaindex(int qnaindex) {
		this.qnaindex = qnaindex;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnacontents() {
		return qnacontents;
	}
	public void setQnacontents(String qnacontents) {
		this.qnacontents = qnacontents;
	}
	
	@Override
	public String toString() {
		return "QnaDTO [qnaindex=" + qnaindex + ", qnatitle=" + qnatitle + ", qnacontents=" + qnacontents + ", qnadate="
				+ qnadate + "]";
	}
	
	
	
}
