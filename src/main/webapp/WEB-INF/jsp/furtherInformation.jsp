<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="FurtherInformation" activePage="furtherInformation">
    <h1>Further Information</h1>

    <div class="card text-dark bg-light mb-3" style="width: 100%;">
        <div class="card-body table-responsive">
            <h5 class="card-title">Cloud Measurements</h5>

            <!-- Table for Cost Entries  -->
            <table data-toggle="table" class="table table-striped table-responsive">
                <thead>
                <tr>
                    <th data-sortable="true">Software</th>
                    <th data-sortable="true">Azure co2e</th>
                    <th data-sortable="true">GCP co2e</th>
                    <th data-sortable="true">AWS co2e</th>
                    <th data-sortable="true">Azure kilowatt</th>
                    <th data-sortable="true">GCP kilowatt</th>
                    <th data-sortable="true">AWS kilowatt</th>
                    <th data-sortable="true">Azure cost</th>
                    <th data-sortable="true">GCP cost</th>
                    <th data-sortable="true">AWS cost</th>
                    <th data-sortable="true">Date</th>
                </tr>
                </thead>
                <tbody>

                <!--  list all entries ----------------------------------------------------------- -->

                <c:forEach items="${SoftwareUsed}" var="SoftwareUsed">
                    <tr>
                        <td><c:out value="${SoftwareUsed.softwareUsed}"/></td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="co2e"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="5" value="${CloudDataInternal.co2e}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AZURE'}">
                                    <c:out value="${co2e}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="co2e"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="5" value="${CloudDataInternal.co2e}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'GCP'}">
                                    <c:out value="${co2e}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="co2e"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="5" value="${CloudDataInternal.co2e}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AWS'}">
                                    <c:out value="${co2e}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="kilowatt"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.kilowattHours}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AZURE'}">
                                    <c:out value="${kilowatt}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="kilowatt"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.kilowattHours}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'GCP'}">
                                    <c:out value="${kilowatt}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="kilowatt"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.kilowattHours}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AWS'}">
                                    <c:out value="${kilowatt}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="cost"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.cost}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AZURE'}">
                                    <c:out value="${cost}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="cost"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.cost}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'GCP'}">
                                    <c:out value="${cost}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${CloudDataInternal}" var="CloudDataInternal">
                                <c:set var="time2" value="${CloudDataInternal.timestamp}"/>
                                <c:set var="cloudProvider" value="${CloudDataInternal.cloudProvider}"/>
                                <c:set var="cost"><fmt:formatNumber type="number" minFractionDigits="3" maxFractionDigits="3" value="${CloudDataInternal.cost}"/></c:set>
                                <c:set var="time" value="${SoftwareUsed.timestamp}"/>
                                <c:if test="${time == time2 && cloudProvider == 'AWS'}">
                                    <c:out value="${cost}"/>
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <fmt:parseDate value="${SoftwareUsed.timestamp}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
            <c:if test="${empty SoftwareUsed}">
                <div class="alert alert-info" role="alert">
                    This list is currently empty!
                </div>
            </c:if>
        </div>
    </div>

    <div class="col-md-12">
        <a class="btn btn-success" type="button" href="/dashboard">Back to Dashboard</a>
    </div>
</layout:page-container>


