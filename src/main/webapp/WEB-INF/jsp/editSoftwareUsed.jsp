<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="Edit Software Used" activePage="editSoftwareUsed">
    <div class="card text-dark bg-light mb-3 mt-4" style="margin:auto">
        <div class="card-body">
            <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.softwareUsedCurr']}" />
                <%--@elvariable id="softwareUsedCurr" type="com.cbhk.ccftp.entity.SoftwareUsed"--%>
            <form:form modelAttribute="softwareUsedCurr" method="post" action="changeSoftwareUsed">
                <form:hidden path="id" />
                <fieldset>
                    <legend>Edit Software Used (ID ${softwareUsedCurr.id})</legend>

                    <! ---------------- Timestamp ------------------>
                    <div class="mb-3">
                        <label for="timestamp" class="form-label">Timestamp: </label>
                        <form:hidden path="timestamp" />
                        <c:out value="${softwareUsedCurr.timestamp}"/>
                    </div>

                    <! ---------------- Software ---------------- -->
                    <div class="mb-3">
                        <label for="inputSoftware" class="form-label">Software</label>
                        <form:input path="softwareUsedName" class="form-control" id="inputSoftware" type="text"/>
                        <form:errors path="softwareUsedName" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="/listSoftwareUsed" class="btn btn-default">Cancel</a>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>
</layout:page-container>
