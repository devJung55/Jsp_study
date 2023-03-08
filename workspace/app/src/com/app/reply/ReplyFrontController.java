package com.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Result;

public class ReplyFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String target = uri.replace(contextPath, "").split("\\.")[0];
		
		if(target.equals("/reply/writeOk")) {
			new WriteOkController().execute(req, resp);
		}else if(target.equals("/reply/listOk")) {
			new ListOkController().execute(req, resp);
		}else if(target.equals("/reply/updateOk")) {
			new UpdateOkController().execute(req, resp);
		}else if(target.equals("/reply/deleteOk")) {
			new DeleteOkController().execute(req, resp);
		}else {
			System.out.println(target);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
















