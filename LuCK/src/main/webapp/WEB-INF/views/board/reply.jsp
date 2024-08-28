<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>  
 
 <%
 BufferedReader reader = null;
 
 try{
	   String filePath = application.getRealPath("/resources/js/reply2.js"); 
	   reader = new BufferedReader(new FileReader(filePath));
	   out.print("<script>\n");
	   out.print("var bnoValue='"+request.getParameter("bno")+"'\n;");
	   while(true){
		   String str = reader.readLine();  
		   if(str==null)
		   	break;
		   
		   out.print(str+"\n");  
	   }
	   out.print("</script>");
 }catch(Exception e){
	 e.printStackTrace();
  	
 }finally {
	  try 
	  {
	   reader.close();    
	  }
	  catch(Exception e){
		  e.printStackTrace();
	  }
 }
 %>

 