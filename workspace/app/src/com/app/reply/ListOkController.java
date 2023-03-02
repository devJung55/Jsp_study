package com.app.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.app.Action;
import com.app.Result;
import com.app.reply.dao.ReplyDAO;
import com.app.reply.domain.ReplyMoreDTO;

public class ListOkController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setCharacterEncoding("UTF-8");
		Long boardId = Long.valueOf(req.getParameter("boardId"));
		
//		한 페이지에 출력되는 게시글의 개수
		int rowCount = 5;
		String temp = req.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int startRow = (page - 1) * rowCount;
		int nextStartRow = page * rowCount;
		Map<String, Object> pageMap = new HashMap<String, Object>();
		
		PrintWriter out = resp.getWriter();
		ReplyDAO replyDAO = new ReplyDAO();
		ReplyMoreDTO replyMoreDTO = new ReplyMoreDTO();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		
		pageMap.put("boardId", boardId);
		pageMap.put("startRow", startRow);
		pageMap.put("nextStartRow", nextStartRow);
		pageMap.put("rowCount", rowCount);
		
		replyMoreDTO.setReplyDTOs(replyDAO.selectAll(pageMap));
		replyMoreDTO.setNextPage(replyDAO.isNextPage(pageMap));
		
		replyMoreDTO.getReplyDTOs().stream().map(replyDTO -> new JSONObject(replyDTO)).forEach(jsonArray::put);
		try {
			jsonObject.put("isNextPage", replyMoreDTO.isNextPage());
			jsonObject.put("replies", jsonArray);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		out.print(jsonObject.toString());
		out.close();
		return null;
	}
}
