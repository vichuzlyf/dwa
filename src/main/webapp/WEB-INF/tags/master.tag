<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="head" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <c:set var="url">${pageContext.request.requestURL}</c:set>
    <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
    
    <title>
        <jsp:invoke fragment="title"/>
    </title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sticky-footer.css" rel="stylesheet">

    <jsp:invoke fragment="head"/>
</head>

<body>

<nav class="navbar navbar-inverse ">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">DWA</a>
        </div>

    </div>
</nav>

<div class="container">
    <h1>
        <jsp:invoke fragment="header"/>
    </h1>

    <jsp:doBody/>

    <c:if test="${not empty stacktrace}">
        <div class="alert alert-danger">
            <b>Error:</b><br/>
            ${stacktrace}
        </div>
    </c:if>
</div>

<footer class="footer">
    <div class="container">
        <jsp:invoke fragment="footer"/>
        <p class="text-muted">
            (c)2015, pre <a href="http://cde.sk">cde.sk</a> odkukal <a href="http://mirek.s.cnl.sk">mirek</a>
        </p>
    </div>
</footer>

</body>
</html>
