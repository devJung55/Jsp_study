package com.app.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.reply.dao.ReplyDAO;
import com.app.reply.domain.ReplyVO;

public class WriteOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		ReplyVO replyVO = new ReplyVO();
		ReplyDAO replyDAO = new ReplyDAO();
		
		replyVO.setReplyContent(req.getParameter("replyContent"));
		replyVO.setMemberId((Long)req.getSession().getAttribute("memberId"));
		replyVO.setBoardId(Long.valueOf(req.getParameter("boardId")));
		
		replyDAO.insert(replyVO);
		return null;
	}

}
