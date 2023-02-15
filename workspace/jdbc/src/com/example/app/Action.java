package com.example.app;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServerException, IOException;
}
