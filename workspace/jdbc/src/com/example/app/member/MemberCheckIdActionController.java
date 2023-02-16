package com.example.app.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.example.app.Action;
import com.example.app.Result;
import com.example.app.dao.MemberDAO;

public class MemberCheckIdActionController implements Action {

	@Override
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException {
		MemberDAO memberDAO = new MemberDAO();
		PrintWriter out = resp.getWriter();
		
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.put("check", memberDAO.checkId(req.getParameter("memberIdentification")));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		out.print(jsonObject.toString());
		out.close();
		
		return null;
	}

}












