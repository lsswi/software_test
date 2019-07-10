package com.ascent.util;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
public class Log {
  private static final String logfile= "D:\\temp\\log.txt";
  private static PrintWriter pw;

  public static void println(String message){
     try{
       pw = new PrintWriter(
                          new OutputStreamWriter(
                                  new FileOutputStream(logfile,true)),true);
     } catch(IOException e){ e.printStackTrace();}


     pw.println(message);
     System.out.println(message);

  }


}
