<%@page import="java.sql.*"%>
<html>
<body>
<form action="index.jsp" id="blgpost" method="post">
   <label for="Blog_Title">Blog Title: </label>
   <%
   try{
   	String blgName,blgContent;
    out.print("<input type='text' id='Blog_Title' name='Blog_Title' value='"+request.getParameter("Blog_Title")+"'><br>");
	out.print("<textarea rows='10' cols='100' name='Blog_content' form='blgpost'>"+request.getParameter("Blog_content")+"</textarea><br>");
   	//out.print("Blog_Title: "+request.getParameter("Blog_Title")+"<br>Blog_content: "+request.getParameter("Blog_content"));
       Class.forName("com.mysql.jdbc.Driver");
   	//Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/blog", "root", "");
   	//Statement mystatement = con.createStatement();
   	//mystatement.executeUpdate("INSERT INTO `blog posts` (`name`, `content`, `date`) VALUES ('"+request.getParameter("Blog_Title")+"', '"+request.getParameter("Blog_content")+"', NOW());");
   }   
   catch (Exception e){
   System.out.println(e);
   }
   %>

<br><input type="checkbox" id="Approve" name="Approve" value="approve" checked="checked"><b>Aprrove</b><BR>
  	<input type="submit" value="Submit">

</form>

</body>
</html>