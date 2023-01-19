<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>


<layout:page-container title="Information" activePage="information">
    <h1>Information</h1>
    <div class="card text-dark bg-light mb-3 mt-4" style="margin:auto">
        <div class="card-body">
            <div class="accordion mb-3" id="accordionPanelsStayOpenPayments">
                <!-- First accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingOnePayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseOnePayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseOnePayment">
                            <h5>First Measurement - Jellyfin</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseOnePayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingOnePayment">
                        <div class="accordion-body paymentAccordionBody">
                            Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.
                            See <a href="https://jellyfin.org/">https://jellyfin.org/</a>  for details.
                        </div>
                    </div>
                </div>

                <!-- Second accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingTwoPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseTwoPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseTwoPayment">
                            <h5>Information 2</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwoPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingTwoPayment">
                        <div class="accordion-body paymentAccordionBody">
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                        </div>
                    </div>
                </div>


                <!-- Third accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingThirdPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseThirdPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseTwoPayment">
                            <h5>Information 3</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseThirdPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingThirdPayment">
                        <div class="accordion-body paymentAccordionBody">
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                        </div>
                    </div>
                </div>

                <!-- Fourth accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFourthPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseFourthPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseFourthPayment">
                            <h5>Information 4</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFourthPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingFourthPayment">
                        <div class="accordion-body paymentAccordionBody">
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                        </div>
                    </div>
                </div>

                <!-- Fifth accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFifthPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseFifthPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseTwoPayment">
                            <h5>Information 5</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFifthPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingFifthPayment">
                        <div class="accordion-body paymentAccordionBody">
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:page-container>
