package com.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;

public class LoginController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		String memberIdentification = null, memberPassword = null;
		boolean check = false;
		
		if(req.getHeader("Cookie") != null) {
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("memberIdentification")) {
					memberIdentification = cookie.getValue();
					check = true;
				}else if(cookie.getName().equals("memberPassword")) {
					memberPassword = cookie.getValue();
					check = true;
				}
			}
		}
		
		if(check) {
			req.setAttribute("memberIdentification", memberIdentification);
			req.setAttribute("memberPassword", memberPassword);
			result.setPath("/loginOk.member");
		}else {
			result.setPath("/templates/member/login.jsp");
		}
		return result;
	}

}
