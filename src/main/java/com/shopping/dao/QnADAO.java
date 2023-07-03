package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.Criteria;
import com.shopping.vo.QnAVO;

@Repository
public class QnADAO {

	@Autowired
	private SqlSession sqlSession;

	// ----------------- 문의 리스트
	public List<QnAVO> getQnAList(Criteria cri) {
		System.out.println("getQnAList DAO()");

		return sqlSession.selectList("qna.getQnAList", cri);
	}

	// ----------------- 문의글 갯수
	public int getTotal() {
		System.out.println("getTotal DAO()");

		return sqlSession.selectOne("qna.getTotal");

	}

	// ----------------- 문의 등록
	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA DAO()");

		return sqlSession.insert("qna.insertQnA", vo);
	}

	// ----------------- 관리자 문의 등록
	public int insertQnAAdmin(QnAVO vo) {
		System.out.println("insertQnAAdmin Service()");

		return sqlSession.insert("qna.insertQnAAdmin", vo);
	}

}
