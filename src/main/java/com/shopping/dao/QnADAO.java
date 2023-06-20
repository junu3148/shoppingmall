package com.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.QnAVO;

@Repository
public class QnADAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ----------------- 문의 등록
	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA DAO()");
		
		return sqlSession.insert("qna.insertQnA",vo);
	}
	
	// ----------------- 문의 삭제
	public int deleteQnA(QnAVO vo) {
		System.out.println("deleteQnA DAO()");
		
		return sqlSession.delete("qna.deleteQnA",vo);
		
	}
	
	// ----------------- 관리자 문의 등록
		public int insertQnAAdmin(QnAVO vo) {
			System.out.println("insertQnAAdmin Service()");
			
			return sqlSession.insert(null);
		}

}
