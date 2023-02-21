package com.app.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.app.member.domain.MemberVO;
import com.app.mybatis.config.MyBatisConfig;

public class MemberDAO {
	public SqlSession sqlSession;

	public MemberDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

//   아이디 중복검사
	public boolean checkId(String identification) {
		return sqlSession.selectOne("member.checkId", identification) != null;
	}
	
//   회원가입
	public void join(MemberVO memberVO) {
		sqlSession.insert("member.join", memberVO);
	}

//   로그인
	public Long login(String memberIdentification, String memberPassword) {
		Map<String, String> loginMap = new HashMap();
		
		loginMap.put("memberIdentification", memberIdentification);
		loginMap.put("memberPassword", memberPassword);
		
		return sqlSession.selectOne("member.login", loginMap);
	}

//   전체 회원목록
	public List selectAll() {
		return sqlSession.selectList("member.selectAll");
	}
	
//   회원탈퇴
	public void delete(String memberIdentification) {
		sqlSession.delete("member.delete", memberIdentification);
	}

//   회원이름 수정
	public void update(MemberVO memberVO) {
		sqlSession.update("member.update", memberVO);
	}
}
