package com.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.Action;
import com.app.Result;
import com.app.member.dao.MemberDAO;

public class LoginOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		MemberDAO memberDAO = new MemberDAO();
		HttpSession session = req.getSession();
		boolean autoLogin = Boolean.valueOf(req.getParameter("auto-login"));
		String memberIdentification = req.getParameter("memberIdentification");
		String memberPassword = req.getParameter("memberPassword");
		Long memberId = memberDAO.login(memberIdentification, memberPassword);
		String path = null;
		Result result = new Result();
		
		if(memberId == null) {
			memberIdentification = String.valueOf(req.getAttribute("memberIdentification"));
			memberPassword = String.valueOf(req.getAttribute("memberPassword"));
			memberId = memberDAO.login(memberIdentification, memberPassword);
		}
		
		if(memberId != null) {
			if(autoLogin) {
				Cookie memberIdentificationCookie = new Cookie("memberIdentification", memberIdentification);
				Cookie memberPasswordCookie = new Cookie("memberPassword", memberPassword);
				resp.addCookie(memberIdentificationCookie);
				resp.addCookie(memberPasswordCookie);
			}
			session.setAttribute("memberId", memberId);
			path = req.getContextPath() + "/board/listOk.board";
		}else {
			path = req.getContextPath() + "/login.member?login=false";
		}
		result.setPath(path);
		result.setRedirect(true);
		return result;
	}

}
