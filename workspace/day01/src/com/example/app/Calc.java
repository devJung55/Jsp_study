package com.example.app;

public class Calc {
   private int number1;
   private int number2;
   
   public Calc() {;}

   public Calc(String number1, String number2) {
      super();
      this.number1 = Integer.valueOf(number1);
      this.number2 = Integer.valueOf(number2);
   }
   
   public int add() {return number1 + number2;};
   public int sub() {return number1 - number2;};
   public int mul() {return number1 * number2;};
   public int div() {return number1 / number2;};
}



















