package com.example.app.member;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.app.Action;
import com.example.app.Result;
import com.example.app.dao.MemberDAO;
import com.example.app.domain.MemberVO;

public class MemberMyPageActionController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		Result result = new Result();
		
		req.setAttribute("memberVO", memberDAO.select((Long)req.getSession().getAttribute("memberId")));
		
		result.setPath("myPage.jsp");
		
		return result;
	}

}
