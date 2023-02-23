package com.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;

public class LogoutController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Result result = new Result();
		req.getSession().invalidate();
		
		if(req.getHeader("Cookie") != null) {
			Cookie[] cookies = req.getCookies();
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0); //초단위
				resp.addCookie(cookie);
			}
		}
			
		result.setPath(req.getContextPath() + "/login.member");
		result.setRedirect(true);
		
		return result;
	}

}
