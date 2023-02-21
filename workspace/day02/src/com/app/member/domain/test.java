package com.app.member.domain;

import com.app.member.dao.MemberDAO;

public class test {
	public static void main(String[] args) {
		MemberVO memberVO = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		
//		memberVO.setMemberIdentification("jjy");
//		memberVO.setMemberPassword("1234");
//		memberVO.setMemberName("정지영");
//		memberVO.setMemberBirth("1997-05-05");
		
//		회원가입 테스트
//		memberDAO.join(memberVO);
		
//		로그인 테스트
//		System.out.println(memberDAO.login("jjy", "1234"));
		
//		아이디 중복검사
//		System.out.println(memberDAO.checkId("jjy"));
		
//		회원 전체 정보 테스트 
//		System.out.println(memberDAO.selectAll());
		
//		회원이름 수정 테스트
//		memberVO.setMemberId(5L);
		memberVO.setMemberId(memberDAO.login("jjy", "1234"));
		memberVO.setMemberName("김지영");
		
		memberDAO.update(memberVO);
		
//		회원 삭제 테스트
//		memberDAO.delete("jjy");
		
	}

}
