package com.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Result;
import com.app.board.dao.BoardDAO;
import com.app.member.dao.MemberDAO;

public class BoardFrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String target = uri.replace(contextPath, "").split("\\.")[0];
		Result result = null;
		
		if(target.equals("/board/listOk")) {
			result = new ListOkController().execute(req, resp);
			
		}else if(target.equals("/board/detailOk")){
			result = new DetailOkController().execute(req, resp);
			
		}else if(target.equals("/board/write") || target.equals("/board/update")){
			result = new Result();
			MemberDAO memberDAO = new MemberDAO();
			BoardDAO boardDAO = new BoardDAO();
			
			if(target.equals("/board/update")) {
				req.setAttribute("board", boardDAO.select(Long.valueOf(req.getParameter("boardId"))));
			}
			
			req.setAttribute("page", req.getParameter("page"));
			req.setAttribute("sort", req.getParameter("sort"));
			req.setAttribute("type", req.getParameter("type"));
			req.setAttribute("keyword", req.getParameter("keyword"));
			req.setAttribute("memberName", memberDAO.selectName((Long)req.getSession().getAttribute("memberId")));
			
			result.setPath("/templates/board/" + (target.equals("/board/write") ? "write.jsp" : "update.jsp"));
			
		}else if(target.equals("/board/writeOk")){
			result = new WriteOkController().execute(req, resp);
			
		}else if(target.equals("/board/updateOk")){
			result = new UpdateOkController().execute(req, resp);
			
		}else if(target.equals("/board/deleteOk")){
			result = new DeleteOkController().execute(req, resp);
			
		}else {
			System.out.println(target);
		}
		
		if(result != null) {
			if(result.isRedirect()) {
				resp.sendRedirect(result.getPath());
			}else {
				req.getRequestDispatcher(result.getPath()).forward(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}















