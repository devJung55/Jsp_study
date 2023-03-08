package com.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.reply.dao.ReplyDAO;

public class DeleteOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		ReplyDAO replyDAO = new ReplyDAO();
		replyDAO.delete(Long.valueOf(req.getParameter("replyId")));
		return null;
	}

}
