package com.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.board.dao.BoardDAO;
import com.app.file.dao.FileDAO;

public class DetailOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		Long boardId = Long.valueOf(req.getParameter("boardId"));
		Result result = new Result();
		BoardDAO boardDAO = new BoardDAO();
		FileDAO fileDAO = new FileDAO();
		
		boardDAO.updateReadCount(boardId);
		
		req.setAttribute("board", boardDAO.select(boardId));
		req.setAttribute("page", req.getParameter("page"));
		req.setAttribute("type", req.getParameter("type"));
		req.setAttribute("keyword", req.getParameter("keyword"));
		req.setAttribute("sort", req.getParameter("sort"));
		req.setAttribute("files", fileDAO.select(boardId));
		
		result.setPath("/templates/board/detail.jsp");
		
		return result;
	}

}
