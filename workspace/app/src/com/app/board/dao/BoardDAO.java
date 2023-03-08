package com.app.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.app.board.domain.BoardDTO;
import com.app.board.domain.BoardVO;
import com.app.mybatis.config.MyBatisConfig;

public class BoardDAO {
	public SqlSession sqlSession;
	
	public BoardDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	게시글 목록
	public List<BoardDTO> selectAll(Map<String, Object> pageMap){
		return sqlSession.selectList("board.selectAll", pageMap);
	}
	
//	게시글 총 개수
	public Long getTotal(Map<String, Object> searchMap) {
		return sqlSession.selectOne("board.getTotal", searchMap);
	}
	
//	게시글 조회
	public BoardDTO select(Long boardId) {
		return sqlSession.selectOne("board.select", boardId);
	}
	
//	게시글 추가
	public void insert(BoardVO boardVO) {
		sqlSession.insert("board.insert", boardVO);
	}
	
//	현재 시퀀스 조회
	public Long getCurrentSequence() {
		return sqlSession.selectOne("board.getCurrentSequence");
	}
	
//	게시글 수정
	public void update(BoardVO boardVO) {
		System.out.println(boardVO);
		sqlSession.update("board.update", boardVO);
	}

//	게시글 삭제
	public void delete(Long boardId) {
		sqlSession.delete("board.delete", boardId);
	}
	
//	조회수 수정
	public void updateReadCount(Long boardId) {
		sqlSession.update("board.updateReadCount", boardId);
	}
	
}























