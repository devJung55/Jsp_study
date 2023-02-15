package com.example.app.member;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.app.Action;
import com.example.app.Result;
import com.example.app.dao.MemberDAO;
import com.example.app.domain.MemberVO;

public class MemberJoinActionController implements Action{
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException {
		MemberVO memberVO = new MemberVO();
		MemberDAO memberDAO = new MemberDAO();
		Result result = new Result();
		
		memberVO.setMemberIdentification(req.getParameter("memberIdentification"));
		memberVO.setMemberPassword(new String(Base64.getEncoder().encode(req.getParameter("memberPassword").getBytes())));
		
		memberDAO.join(memberVO);
		
		result.setPath(req.getContextPath() + "/login.member");
		result.setRedirect(true);
		
		return result;
	}
}












