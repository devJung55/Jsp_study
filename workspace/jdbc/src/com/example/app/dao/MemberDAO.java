package com.example.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.app.domain.MemberVO;

public class MemberDAO {
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	
//	아이디 중복검사
	public boolean checkId() {return false;}
//	회원가입
	public void join(MemberVO memberVO) {
		String query = "INSERT INTO TBL_MEMBER(MEMBER_ID, MEMBER_IDENTIFICATION, MEMBER_PASSWORD) "
				+ "VALUES(SEQ_MEMBER.NEXTVAL, ?, ?)";
		try {
			connection = DBConnecter.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, memberVO.getMemberIdentification());
			preparedStatement.setString(2, memberVO.getMemberPassword());
		} catch (SQLException e) {
			System.out.println("join(MemberVO) SQL문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("join(MemberVO) 오류");
			e.printStackTrace();
		}
	}
//	로그인
	public Long login() {return null;}
}












