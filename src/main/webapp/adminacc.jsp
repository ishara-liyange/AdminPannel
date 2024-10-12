                                                          <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="st" items="${adminList}">
	${st.a_id}
	${st.a_name}
	${st.a_nic}
	${st.a_phone}
	${st.a_email}
	${st.a_password}
	
	
	</c:forEach>
</body>
</html>