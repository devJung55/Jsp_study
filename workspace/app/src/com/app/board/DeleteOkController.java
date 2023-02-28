package com.app.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Action;
import com.app.Result;
import com.app.board.dao.BoardDAO;
import com.app.file.dao.FileDAO;

public class DeleteOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		BoardDAO boardDAO = new BoardDAO();
		FileDAO fileDAO = new FileDAO();
		Result result = new Result();
		Long boardId = Long.valueOf(req.getParameter("boardId"));
		String uploadPath = req.getSession().getServletContext().getRealPath("/") + "upload/";
		
		fileDAO.select(boardId).stream().map(file -> new File(uploadPath + file.getFileSystemName())).forEach(file -> {
			if(file.exists()) {
				file.delete();
			}
		});
		
		fileDAO.delete(boardId);
		boardDAO.delete(boardId);
		result.setPath(req.getContextPath() + "/board/listOk.board");
		result.setRedirect(true);
		
		return result;
	}

}
