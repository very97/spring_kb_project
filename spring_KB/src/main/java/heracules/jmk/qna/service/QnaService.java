package heracules.jmk.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import heracules.jmk.qna.dao.QnaDAO;
import heracules.jmk.qna.dto.QnaDTO;
import heracules.jmk.qna.dto.ReplyDTO;
import heracules.jmk.qna.dto.SearchCriteria;

@Service
public class QnaService {
	
	@Autowired
	public QnaDAO qnaDAO;
	
	//-----------------SelectAll
	public List<QnaDTO> qnaselectAll(SearchCriteria scri)throws Exception {
		return qnaDAO.selectAll(scri);
	}
	
	//-----------------Select Detail
	public QnaDTO Select(int qnaindex) {
		return qnaDAO.select(qnaindex);
	}
	
	//-----------------Insert
	public void Insert(QnaDTO qnaDTO) {
		try {
			
			qnaDAO.insert(qnaDTO);
			//데이터 무결성 검사 => 예외발생시 정상 종료?를 통해 재입력 페이지로 이동
		}catch(DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	//------------------Update
	public void Update(QnaDTO qnaDTO) {
		qnaDAO.update(qnaDTO);
	}
	
	//-----------------Delete
	public void Delete(int qnaindex) {
		qnaDAO.delete(qnaindex);
	}

	public int listCount(SearchCriteria scri) {
		return qnaDAO.count(scri);
		
	}
	
	public List<ReplyDTO> readReply(int qnaindex) throws Exception {
		return qnaDAO.readReply(qnaindex);
	}
	
	
}
