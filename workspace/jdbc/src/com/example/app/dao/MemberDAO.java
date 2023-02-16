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
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("join(MemberVO) SQL문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("join(MemberVO) 오류");
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}
//	로그인
	public Long login(String memberIdentification, String memberPassword) {
		Long memberId = null;
		String query = "SELECT MEMBER_ID FROM TBL_MEMBER WHERE MEMBER_IDENTIFICATION = ? AND MEMBER_PASSWORD = ?";
		try {
			connection = DBConnecter.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, memberIdentification);
			preparedStatement.setString(2, memberPassword);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				memberId = resultSet.getLong(1);
			}
			
		} catch (SQLException e) {
			System.out.println("login(String) SQL문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("login(String) 오류");
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
				
		return memberId;
	}
	
//	마이페이지
	public MemberVO select(Long memberId) {
		MemberVO memberVO = null;
		String query = "SELECT MEMBER_ID, MEMBER_IDENTIFICATION, MEMBER_PASSWORD FROM TBL_MEMBER WHERE MEMBER_ID = ?";
		try {
			connection = DBConnecter.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setLong(1, memberId);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				memberVO = new MemberVO();
				memberVO.setMemberId(resultSet.getLong(1));
				memberVO.setMemberIdentification(resultSet.getString(2));
				memberVO.setMemberPassword(resultSet.getString(3));
			}
			
		} catch (SQLException e) {
			System.out.println("join(MemberVO) SQL문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("join(MemberVO) 오류");
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		return memberVO;
	}
	
//	아이디 중복검사
	public boolean checkId(String memberIdentification) {
		boolean check = false;
		String query = "SELECT MEMBER_ID FROM TBL_MEMBER WHERE MEMBER_IDENTIFICATION = ?";
		try {
			connection = DBConnecter.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, memberIdentification);
			resultSet = preparedStatement.executeQuery();
			
			check = resultSet.next();
			
		} catch (SQLException e) {
			System.out.println("join(MemberVO) SQL문 오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("join(MemberVO) 오류");
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) {
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
		
		return check;
	}
}












