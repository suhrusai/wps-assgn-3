<%@page import="java.sql.*"%>
<html>
<head>
<title>SELECT Operation</title>
</head>

<body>
	<form action="preview.jsp" id="blgpost" method="post">
		<label for="Blog_Title">Blog Title: </label> <input type="text"
			id="Blog_Title" name="Blog_Title"><br> <label
			for="Blog_Content">Blog Content: </label><br>

		<textarea rows="10" cols="100" name="Blog_content" form="blgpost"></textarea>
		<br> <input type="submit" value="Submit">
	</form>


	<br>
	<%
		try {
		if (request.getParameter("Approve").equals("approve")) {
			try {
		String blgName, blgContent;
		//out.print("Blog_Title: "+request.getParameter("Blog_Title")+"<br>Blog_content: "+request.getParameter("Blog_content")+"<br>Isapproved:"+request.getParameter("Approve").equals("approve"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/blog", "root", "");
		Statement mystatement = con.createStatement();
		mystatement.executeUpdate("INSERT INTO `blog posts` (`name`, `content`, `date`) VALUES ('"
				+ request.getParameter("Blog_Title") + "', '" + request.getParameter("Blog_content")
				+ "', NOW());");
			} catch (Exception e) {
		System.out.println(e);
			}
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>

	<%
		try {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/blog", "root", "");
		Statement mystatement = con.createStatement();
		ResultSet res = mystatement.executeQuery("select * from `blog posts`");
		while (res.next()) {
			out.print("<b>" + res.getString("name") + "</b>" + "<br>" + res.getString("content") + " <br>Time: "
			+ res.getString("date") + "<br><br>");
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>