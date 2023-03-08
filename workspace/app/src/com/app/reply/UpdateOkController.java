package com.app.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.app.Action;
import com.app.Result;
import com.app.reply.dao.ReplyDAO;
import com.app.reply.domain.ReplyVO;

public class UpdateOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyVO replyVO = new ReplyVO();
		Long replyId = Long.valueOf(req.getParameter("replyId"));
		JSONObject jsonObject = null;
		
		replyVO.setReplyId(replyId);
		replyVO.setReplyContent(req.getParameter("replyContent"));
		
		replyDAO.update(replyVO);
		jsonObject = new JSONObject(replyDAO.select(replyId));
		out.print(jsonObject.toString());
		out.close();
		return null;
	}

}
