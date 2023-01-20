package heracules.jmk.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import heracules.jmk.qna.dto.QnaDTO;
import heracules.jmk.qna.dto.ReplyDTO;
import heracules.jmk.qna.dto.SearchCriteria;

@Repository

@EnableAspectJAutoProxy(proxyTargetClass = true)

public class QnaDAO {
	
	@Autowired
	
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public List<QnaDTO> selectAll(SearchCriteria scri) {
		
		return sqlSessionTemplate.selectList("selectAll", scri);
	}
	
	public QnaDTO select(int qnaindex) {
		return sqlSessionTemplate.selectOne("select", qnaindex);
	}
	
	@Transactional
	public void insert(QnaDTO qnaDTO) {
		sqlSessionTemplate.insert("insert", qnaDTO);
	}
	
	public void update(QnaDTO qnaDTO) {
		sqlSessionTemplate.update("update",qnaDTO);
	}
	
	public void delete(int qnaindex) {
		sqlSessionTemplate.delete("delete", qnaindex);
	}
	
	//------------게시물 총 갯수-----------------------------
	public int count(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("listCount",scri);
	}
	//------------댓글 select------------------------------
	public List<ReplyDTO> readReply(int qnaindex) {
		return sqlSessionTemplate.selectList("readreply", qnaindex);
	}
	//------------댓글 insert------------------------------
	public void writeReply(ReplyDTO replyDTO) {
		sqlSessionTemplate.insert("writeReply", replyDTO);
	}
	//---------------조회수 hit--------------------
	public void hit(int qnaindex) {
		sqlSessionTemplate.update("hit",qnaindex);
	}
}
