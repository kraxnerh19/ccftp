<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="Dashboard" activePage="dashboard">
    <div class="d-grid gap-2 mb-3">
        <a href="/refresh" class="btn btn-success refreshButton" role="button" type="button">
            Refresh Data From Cloud Carbon Footprint API
        </a>
    </div>
    <div class="card text-dark bg-light mb-3">
        <div class="card-header">
            <h5 class="card-title">Charts & Graphs</h5>

            <div class="d-flex justify-content-center bd-highlight mb-3">
                <div class="me-auto p-2 bd-highlight justify-content-center">
                    <ul class="nav nav-pills justify-content-center nav-fill nav-tabs card-header-tabs" data-bs-tabs="tabs" id="chartIdNav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="true" data-bs-toggle="tab" href="#chart1Pane"
                               onclick="getChartData()">CO2-Emissions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#chart2Pane" onclick="getChartData()">KWH</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#chart3Pane" onclick="getChartData()">Costs</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Charts & Graphs -->
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <form class="card-body tab-content" id="#chartPanels">
            <div class="tab-pane active" id="chart1Pane">
                <canvas id="chart1" style="width:100%; max-width:1000px; margin:auto; max-height:1000px;" aria-label="CO2 Emissions Chart" role="img"></canvas>
            </div>
            <div class="tab-pane" id="chart2Pane">
                <canvas id="chart2" style="width:100%; max-width:1000px; margin:auto; max-height:1000px;" aria-label="Kilowatt Hours Used Chart" role="img"></canvas>
            </div>
            <div class="tab-pane" id="chart3Pane">
                <canvas id="chart3" style="width:100%; max-width:1000px; margin:auto; max-height:1000px;" aria-label="Costs Chart" role="img"></canvas>
            </div>
        </form>
    </div>


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
                    <th data-sortable="true">Date</th>
                    <div class="col-md-12">
                        <a class="btn btn-success float-end" type="button" href="/furtherInformation">Further Information</a>
                    </div>
                </tr>
                </thead>
                <tbody>

                <!--  list all entries ----------------------------------------------------------- -->

                <c:forEach items="${SoftwareUsed}" var="SoftwareUsed">
                    <tr>
                        <td><c:out value="${SoftwareUsed.softwareUsedName}"/></td>
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

    <!-- Modal -->
    <div class="modal fade" id="confirmDeleteEntry" tabindex="-1" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Attentione!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do you really want to delete this entry?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a type="button" class="btn btn-danger btn-ok">Delete</a>
                </div>
            </div>
        </div>
    </div>


    <script>
        document.getElementById("confirmDeleteEntry").addEventListener('shown.bs.modal', e => {
                const btn = e.target.getElementsByClassName('btn-ok')[0]
                btn.href = e.relatedTarget.dataset.href
                console.log(btn.href)
                btn.addEventListener('click', p =>
                    window.location = btn.href
                )
            }
        )
    </script>
    <script type="text/JavaScript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>

</layout:page-container>

<!-- Load the first chart, has to happen after the page container -->
<script>
    getChartData();
</script>
