package heracules.jmk.qna.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter 
@Setter
@ToString

public class QnaDTO {

	private int qnaindex;
	private String qnatitle;
	private String qnacontents;
	private Date qnadate;
	
	private int cnt;
}
