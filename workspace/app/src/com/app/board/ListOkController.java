package com.app.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.app.Action;
import com.app.Result;
import com.app.board.dao.BoardDAO;
import com.app.board.domain.BoardDTO;
import com.app.file.dao.FileDAO;
import com.app.file.domain.FileVO;

public class ListOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		FileDAO fileDAO = new FileDAO();
		BoardDAO boardDAO = new BoardDAO();
		Result result = new Result();
		JSONArray boardJsons = new JSONArray();
		JSONObject fileJsons = new JSONObject();
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		Map<String, Object> searchMap = new HashMap<String, Object>();
		List<FileVO> fileList = null;
		List<BoardDTO> boardList = null;
		
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		String temp = req.getParameter("page"); 
		String sort = req.getParameter("sort");
		String[] types = null;
		
		types = type == null || type.equals("null") ? null : type.split("&");
		int page = temp == null || temp.equals("null") ? 1 : Integer.parseInt(temp);
		
		searchMap.put("keyword", keyword);
		searchMap.put("types", types);
		
		Long total = boardDAO.getTotal(searchMap);
//		한 페이지에 출력되는 게시글의 개수
		int rowCount = 5;
//		한 페이지에서 나오는 페이지 버튼의 개수
		int pageCount = 5;
		int startRow = (page - 1) * rowCount;
		
		int endPage = (int)(Math.ceil(page / (double)pageCount) * pageCount);
		int startPage = endPage - (pageCount - 1);
		int realEndPage = (int)Math.ceil(total / (double)rowCount);
		
		boolean prev = startPage > 1;
		boolean next = false;
		endPage = endPage > realEndPage ? realEndPage : endPage;
		next = endPage != realEndPage;
		
		sort = sort == null ? "recent" : sort;
		
		pageMap.put("rowCount", rowCount);
		pageMap.put("startRow", startRow);
		pageMap.put("sort", sort);
		pageMap.put("keyword", keyword);
		pageMap.put("types", types);
		
		boardList = boardDAO.selectAll(pageMap);
		
		boardList.stream().map(board -> new JSONObject(board)).forEach(boardJsons::put);
		
		boardList.stream().map(BoardDTO::getBoardId).map(fileDAO::select).collect(Collectors.toList())
			.stream().filter(files -> files.size() != 0).map(files -> files.get(0)).map(file -> new JSONObject(file))
			.forEach(json -> {
				try {
					fileJsons.put(String.valueOf(json.get("boardId")), json);
				} catch (JSONException e) {
					e.printStackTrace();
				}	
			});
		
		req.setAttribute("boards", boardJsons.toString());
		req.setAttribute("files", fileJsons.toString());
		req.setAttribute("total", total);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("page", page);
		req.setAttribute("prev", prev);
		req.setAttribute("next", next);
		req.setAttribute("sort", sort);
		req.setAttribute("keyword", keyword);
		req.setAttribute("type", type);
		
		result.setPath("/templates/board/list.jsp");
		
		return result;
	}

}
