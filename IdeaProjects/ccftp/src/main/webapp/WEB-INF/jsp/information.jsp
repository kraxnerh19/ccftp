<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="Information" activePage="information">
    <h1>Information</h1>
    <script type="text/JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>

</layout:page-container>

<!-- Load the first chart, has to happen after the page container -->
<script>
    getChartData();
</script>
