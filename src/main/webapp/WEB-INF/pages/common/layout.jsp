<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="language" content="English" />
		
		<title>Welcome - Spring:Atmosphere</title>
		
				
		<link rel="stylesheet" href="<c:url value='/resources/css/blueprint/screen.css'/>" type="text/css" media="screen, projection">
        <link rel="stylesheet" href="<c:url value='/resources/css/blueprint/print.css'/>"  type="text/css" media="print">
        <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>"  type="text/css">
        <!--[if lt IE 8]>
            <link rel="stylesheet" href="/resources/css/blueprint/ie.css" type="text/css" media="screen, projection">
        <![endif]-->
				
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/normalize.css" />" media="all"/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/global.css" />" media="all"/>



        <script src="<c:url value='/resources/js/jquery/jquery-1.4.2.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery/jquery.tmpl.min.js'/>"></script>
        <script src="<c:url value='/resources/js/jquery/jquery.atmosphere.js'/>"></script>
		
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	</head>

	<body>
	
		<div id="container">
			
			<!--  header -->
			<tiles:insertAttribute name="header"/>
			
			<!-- main central container -->
			<tiles:insertAttribute name="body"/>
	    		
			<!-- footer -->
			<tiles:insertAttribute name="footer"/>
			
		</div>
	
	</body>
</html>