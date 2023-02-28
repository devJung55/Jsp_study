package com.app.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.app.member.domain.MemberVO;
import com.app.mybatis.config.MyBatisConfig;

public class MemberDAO {
	public SqlSession sqlSession;
	
	public MemberDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	아이디 중복검사
	public boolean checkId(String memberIdentification) {
		return sqlSession.selectOne("member.checkId", memberIdentification) != null;
	}
	
//	회원가입
	public void join(MemberVO memberVO) {
		sqlSession.insert("member.join", memberVO);
	}
	
//	로그인
	public Long login(String memberIdentification, String memberPassword) {
		Map<String, String> loginMap = new HashMap<String, String>();
		loginMap.put("memberIdentification", memberIdentification);
		loginMap.put("memberPassword", memberPassword);
		return sqlSession.selectOne("member.login", loginMap);
	}
	
//	이름 조회
	public String selectName(Long memberId) {
		return sqlSession.selectOne("member.selectName", memberId);
	}
	
}


























