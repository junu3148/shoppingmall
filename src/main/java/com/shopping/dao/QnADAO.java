package com.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.QnAVO;

@Repository
public class QnADAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA DAO()");
		
		return sqlSession.insert("qna.insertQnA",vo);
	}

}
