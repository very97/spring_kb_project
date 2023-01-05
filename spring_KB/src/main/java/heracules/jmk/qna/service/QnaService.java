package heracules.jmk.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import heracules.jmk.qna.dao.QnaDAO;
import heracules.jmk.qna.dto.QnaDTO;

@Service
public class QnaService {
	
	@Autowired
	public QnaDAO qnaDAO;
	
	public List<QnaDTO> qnaselectAll() {
		return qnaDAO.selectAll();
	}
	
}
