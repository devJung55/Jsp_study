package com.app.file.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.app.file.domain.FileVO;
import com.app.mybatis.config.MyBatisConfig;

public class FileDAO {
	public SqlSession sqlSession;
	
	public FileDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

//	첨부파일 추가
	public void insert(FileVO fileVO) {
		sqlSession.insert("file.insert", fileVO);
	}
	
//	첨부파일 조회
	public List<FileVO> select(Long boardId) {
		return sqlSession.selectList("file.select", boardId);
	}
	
//	첨부파일 삭제
	public void delete(Long boardId) {
		sqlSession.delete("file.delete", boardId);
	}
}

















