<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="listSoftwareUsed" activePage="listSoftwareUsed">
    <div class="card text-dark bg-light mb-3 mt-4" style="margin:auto">
        <div class="card-body">
            <div class="accordion mb-3" id="accordionPanelsStayOpenPayments">
                <!-- First accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingOnePayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseOnePayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseOnePayment">
                            <h5>All</h5>
                        </button>
                    </h2>
                    <!-- TODO CB - delete class show if you implement more than "all"-header -->
                    <div id="panelsStayOpen-collapseOnePayment" class="accordion-collapse collapse show"
                         aria-labelledby="panelsStayOpen-headingOnePayment">
                        <div class="accordion-body paymentAccordionBody">
                            <table data-toggle="table" class="table table-striped">
                                <thead>
                                <tr>
                                    <th data-sortable="true">Timestamp</th>
                                    <th data-sortable="true">Software</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!--  list all entries in softwareUsed ----------------------------------------------------------- -->
                                <c:forEach items="${softwareUsed}" var="software">
                                    <tr>
                                        <td><i class="bi bi-calendar-minus-fill">  <c:out value="${software.timestamp}"/>
                                        </td>
                                        <td><i class="bi bi-cloud-check-fill"></i>  <c:out value="${software.softwareUsedName}"/>
                                        </td>
                                        <td>
                                                <div class="row">
                                                    <a href="editSoftwareUsed?id=${software.id}"
                                                       class="col btn btn-success mb-3"><i
                                                            class="bi bi-pencil-fill"></i> Edit</a>
                                                    <form method="post" class="col"
                                                          action="/deleteSoftwareUsed?id=${software.id}">
                                                        <sec:csrfInput/>
                                                        <button data-bs-toggle="modal"
                                                                data-href="deleteSoftwareUsed?id=${software.id}"
                                                                data-bs-target="#confirmDelete" type="button"
                                                                class="btn btn-danger"><i class="bi bi-trash"></i>
                                                            Delete
                                                        </button>
                                                    </form>
                                                </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${empty softwareUsed}">
                                <div class="alert alert-success" role="alert">
                                    This list is currently empty. Create or import new data to start.
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Attentione!</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Do your really want to delete this entry?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <a type="button" class="btn btn-danger btn-ok">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("confirmDelete").addEventListener('shown.bs.modal', e => {
                const btn = e.target.getElementsByClassName('btn-ok')[0]
                btn.href = e.relatedTarget.dataset.href
                console.log(btn.href)
                btn.addEventListener('click', p =>
                    window.location = btn.href
                )
            }
        )
    </script>
</layout:page-container>