package heracules.jmk.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;

import heracules.jmk.qna.dto.QnaDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class QnaDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<QnaDTO> selectAll() {
		return sqlSessionTemplate.selectList("selectAll");
	}

}
