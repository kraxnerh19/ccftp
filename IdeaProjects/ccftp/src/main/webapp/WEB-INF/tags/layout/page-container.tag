<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>${title}</title>
    <bootstrap:bootstrap-css/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body>
<!-- Top Navigation -->
<nav class="navbar fixed-top navbar-dark bg-dark" id="navbarTop">
    <div class="container-fluid">
        <a class="navbar-brand">
            <button class="openbtn" onclick="toggleNav()">&#9776;</button>
            <img src="/img/cash-coin.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
            <a href="/dashboard" class="me-auto" id="mainTitle">Household Finance Manager</a>
        </a>
    </div>
</nav>


<!-- Sidebar Navigation -->
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="dashboardButton" id="dashboardButton" type="button" aria-expanded="true">
                    <a href="/dashboard">Dashboard</a>
                </button>
            </h2>
        </div>
    </div>
</div>

<div class="container-fluid" role="main">


    <div class="container" role="main">

        <div id="main">
            <!-- Messages ----------------------------------------------------------- -->

            <!-- Error message ----------------------------------------------------------- -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger" role="alert">${errorMessage}</div>
            </c:if>
            <!-- Error message ----------------------------------------------------------- -->

            <!-- Warning message ----------------------------------------------------------- -->
            <c:if test="${not empty warningMessage}">
                <div class="alert alert-warning" role="warning">${warningMessage}</div>
            </c:if>
            <!-- Warning message ----------------------------------------------------------- -->

            <!-- successful message ----------------------------------------------------------- -->
            <c:if test="${not empty message}">
                <div class="alert alert-success" role="warning">${message}</div>
            </c:if>
            <!-- successful message ----------------------------------------------------------- -->

            <!-- Messages ----------------------------------------------------------- -->

            <jsp:doBody/>
        </div>
    </div>
</div>




<bootstrap:bootstrap-js/>
<script src="/js/custom.js"></script>
<script type="text/JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
</body>
</html>
