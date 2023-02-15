package com.example.app;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Oper extends HttpServlet{
   private static final long serialVersionUID = 1L;

   public Oper() {;}
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      resp.setContentType("text/html; charset=UTF-8");
      PrintWriter out = resp.getWriter();
      String input = req.getParameter("input");
      String opers = "+-*/", message = null;
      String[] nums = null;
      char oper = ' ';
      Calc calc = null;
      int result = 0;
      
      for (int i = 0; i < input.length(); i++) {
         int j = 0;
         for (j = 0; j < opers.length(); j++) {
            if(input.charAt(i) == opers.charAt(j)) {
               oper = opers.charAt(j);
               break;
            }
         }
         if(j != opers.length()) {break;}
      }
      try {
         nums = input.split("\\" + oper);
         calc = new Calc(nums[0], nums[1]);
      
         switch(oper) {
         case '+':
            result = calc.add();
            break;
         case '-':
            result = calc.sub();
            break;
         case '*':
            result = calc.mul();
            break;
         case '/':
            result = calc.div();
            break;
         }
         message = "<h1>결과: " + result + "</h1>";
         
      } catch (ArithmeticException e) {
         message = "<h1 style='color: red;'>0으로 나눌 수 없습니다.</h1>";
         
      } catch (ArrayIndexOutOfBoundsException | NumberFormatException e) {
         message = "<h1 style='color: red;'>잘못된 수식입니다.</h1>";
         e.printStackTrace();
         
      } catch (Exception e) {
         message = "<h1 style='color: red;'>다시 시도해주세요./h1>";
         e.printStackTrace();
      }
      
      out.print(message);
      out.print("<a href='calc'>다시 계산하기</a>");
      out.close();
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      super.doGet(req, resp);
   }
}












