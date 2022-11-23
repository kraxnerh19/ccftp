<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="Dashboard" activePage="dashboard">
    <div class="card text-dark bg-light mb-3">
        <div class="card-header">
            <h5 class="card-title">Charts & Graphs</h5>

            <div class="d-flex bd-highlight mb-3">
                <div class="me-auto p-2 bd-highlight">
                    <ul class="nav nav-tabs card-header-tabs" data-bs-tabs="tabs" id="chartIdNav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="true" data-bs-toggle="tab" href="#chart1Pane"
                               onclick="getChartData()">Chart 1</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#chart2Pane" onclick="getChartData()">Chart
                                2</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#chart3Pane" onclick="getChartData()">Chart
                                3</a>
                        </li>
                    </ul>
                </div>
                <div class="p-2 bd-highlight" id="timeFrameNav">
                    <div class="form-check form-check-inline" id="chartSelectorDateLimitWeek">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1week"
                               value="option1" onclick="getChartData()" checked>
                        <label class="form-check-label" for="inlineRadio1week">Week</label>
                    </div>
                    <div class="form-check form-check-inline" id="chartSelectorDateLimitMonth">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2month"
                               value="option2" onclick="getChartData()" checked>
                        <label class="form-check-label" for="inlineRadio2month">Month</label>
                    </div>
                    <div class="form-check form-check-inline" id="chartSelectorDateLimitYear">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3year"
                               value="option3" onclick="getChartData()">
                        <label class="form-check-label" for="inlineRadio3year">Year</label>
                    </div>
                    <div class="form-check form-check-inline" id="chartSelectorDateLimitAll">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4all"
                               value="option4" onclick="getChartData()">
                        <label class="form-check-label" for="inlineRadio4all">All</label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts & Graphs -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
        <form class="card-body tab-content" id="#chartPanels">
            <div class="tab-pane active" id="chart1Pane">
                <canvas id="chart1" style="width:100%; max-width:1000px; margin:auto;"></canvas>
            </div>
            <div class="tab-pane" id="chart2Pane">
                <canvas id="chart2" style="width:100%; max-width:1000px; margin:auto;"></canvas>
            </div>
            <div class="tab-pane" id="chart3Pane">
                <canvas id="chart3" style="width:100%; max-width:1000px; margin:auto;"></canvas>
            </div>
        </form>
    </div>


    <div class="card text-dark bg-light mb-3" style="width: 100%;">
        <div class="card-body table-responsive">
            <h5 class="card-title">Cost positions</h5>

            <!-- Table for Cost Entries  -->
            <table data-toggle="table" class="table table-striped table-responsive">
                <thead>
                <tr>
                    <th data-sortable="true">Name</th>
                    <th data-sortable="true">Price</th>
                    <th data-sortable="true">Price Share</th>
                    <th data-sortable="true">Date</th>
                    <th data-sortable="true">Categories</th>
                    <th data-sortable="true">Creator</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all entries ----------------------------------------------------------- -->
                <c:forEach items="${entries}" var="entries">
                    <tr>
                        <td><c:out value="${entries.name}"/></td>
                        <td><c:out value="${entries.price}"/> <c:out
                                value="${currentHousehold.currency.shortName}"/></td>
                        <td>
                            <!-- calculate price share -->
                            <c:set var="memberContain" value="no"/>
                            <c:set var="currentUserJSTL" value="${currentUser}"/>

                            <c:forEach var="member" items="${entries.members}">
                                <c:if test="${fn:contains(member.username, currentUserJSTL)}">
                                    <c:set var="memberContain" value="yes"/>
                                </c:if>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${fn:contains(memberContain, 'yes')}">
                                    <c:out value="${Math.ceil(entries.price/entries.members.size()*100)/100}"/>
                                    <c:out value="${currentHousehold.currency.shortName}"/>
                                </c:when>
                                <c:otherwise>
                                    <c:out value="${0.00}"/>
                                    <c:out value="${currentHousehold.currency.shortName}"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:parseDate value="${entries.date}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td>
                            <c:forEach var="categories" items="${entries.categories}">
                                <option value="${categories.id}">${categories.name}</option>
                            </c:forEach>
                        </td>
                        <td><i class="bi bi-person-fill"></i> <c:out value="${entries.creator.username}"/></td>
                        <td>
                            <!-- only display, if the user has the permission to edit/delete this entry -->
                            <c:if test="${entries.creator == currentUserComplete
                            || fn:contains(currentUserRole, 'ROLE_ADMIN')
                            || currentHousehold.creator == currentUserComplete
                            || fn:contains(currentHousehold.householdAdmins, currentUserComplete)
                            }">
                            <div class="btn-group-vertical">
                                <a href="editEntry?id=${entries.id}" class="col btn btn-success mb-1 rounded-bottom"><i
                                        class="bi bi-pencil-fill"></i> Edit</a>
                                <form method="post" class="col" action="/deleteEntry?id=${entries.id}">
                                    <sec:csrfInput/>
                                    <button data-bs-toggle="modal" data-href="deleteEntry?id=${entries.id}"
                                            data-bs-target="#confirmDeleteEntry" type="button"
                                            class="btn btn-danger"><i class="bi bi-trash-fill"></i> Delete
                                    </button>
                                </form>
                            </div>
                        </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <c:if test="${empty entries}">
                <div class="alert alert-info" role="alert">
                    This list is currently empty. Create a new cost position to expand the list.
                </div>
            </c:if>
            <div class="d-grid gap-2">
                <a class="btn btn-success" type="button" href="/editEntry">Create new entry</a>
            </div>
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
