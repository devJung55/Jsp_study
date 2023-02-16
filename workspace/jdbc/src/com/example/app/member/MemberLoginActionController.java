package com.example.app.member;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.app.Action;
import com.example.app.Result;
import com.example.app.dao.MemberDAO;

public class MemberLoginActionController implements Action {
	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		Result result = new Result();
		String path = null;
		Long memberId = null;
		
		memberId = memberDAO.login(req.getParameter("memberIdentification"), req.getParameter("memberPassword"));
		
		if(memberId != null) {
			path = "/index.main";
			req.getSession().setAttribute("memberId", memberId);
		}else {
			path = "/login.member?login=false";
		}
		
		result.setPath(req.getContextPath() + path);
		result.setRedirect(true);
		
		return result;
	}
}











