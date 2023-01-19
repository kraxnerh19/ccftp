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
                            <h5>How do we get our data?</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseOnePayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingOnePayment">
                        <div class="accordion-body paymentAccordionBody">
                            The presented data is retrieved and calculated by the free and open-source tool Cloud Carbon Footprint.<br>
                            Source: <a href="https://www.cloudcarbonfootprint.org/">https://www.cloudcarbonfootprint.org/</a><br>
                            <br>
                            The tool is configured to retrieve usage data from AWS, Azure and GCP.
                            The usage data is converted to energy to calculate emission data
                            while including the power usage effectiveness of the cloud provider's data centers and the carbon intensity
                            of the region where the data center pulls power from.
                        </div>
                    </div>
                </div>

                <!-- Second accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingTwoPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseTwoPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseTwoPayment">
                            <h5>How is the CO2 estimate calculated?</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseTwoPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingTwoPayment">
                        <div class="accordion-body paymentAccordionBody">
                            The Cloud Carbon Footprint API calculates the CO2e estimates with this formula: <br>
                            <b>Total CO2e</b> = operational emissions + embodied Emissions <br>
                            <br>
                            <b>Operational emissions</b> = (Cloud provider service usage) x (Cloud energy conversion factors [kWh]) x
                            (Cloud provider Power Usage Effectiveness (PUE)) x (grid emissions factors [metric tons CO2e]) <br>
                            <br>
                            <b>Embodied Emissions</b> = estimated metric tons CO2e emissions from the manufacturing of datacenter servers, for compute usage<br>
                            <br>
                            <b>Source</b>: <a href="https://www.cloudcarbonfootprint.org/">https://www.cloudcarbonfootprint.org/</a><br>
                        </div>
                    </div>
                </div>


                <!-- Third accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingThirdPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseThirdPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseTwoPayment">
                            <h5>How can I connect the Cloud Carbon Footprint API?</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseThirdPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingThirdPayment">
                        <div class="accordion-body paymentAccordionBody">
                            For this prototype to work, you have to install a local copy of Cloud Carbon Footprint.
                            Further installation instruction can be retrieved from our project documentation or in a more general format on the
                            Cloud Carbon Footprint documentation: <a href="https://www.cloudcarbonfootprint.org/docs/getting-started">
                            https://www.cloudcarbonfootprint.org/docs/getting-started</a> <br><br>
                            Currently supported cloud provider are AWS, Azure and GCP, but more providers are considered by the
                            open-source-community developing this tool and might be supported in the future.
                        </div>
                    </div>
                </div>

                <!-- Fourth accordion item -->
                <div class="accordion-item paymentAccordionItem">
                    <h2 class="accordion-header" id="panelsStayOpen-headingFourthPayment">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#panelsStayOpen-collapseFourthPayment" aria-expanded="false"
                                aria-controls="panelsStayOpen-collapseFourthPayment">
                            <h5>Why are my graphs not showing any data?</h5>
                        </button>
                    </h2>
                    <div id="panelsStayOpen-collapseFourthPayment" class="accordion-collapse collapse"
                         aria-labelledby="panelsStayOpen-headingFourthPayment">
                        <div class="accordion-body paymentAccordionBody">
                            You might want to check if you refreshed your data from the API by using the refresh button in the dashboard. <br>
                            If you see data in as tables on the dashboard, but not as graphs, then you need to label a timestamp with a software in the software tab.<br>
                            Only timestamps with a software name as a label are showed as graphs. <br>
                            <br>
                            If there isn't any data you might check your connection to the cloud providers in your local installation of Cloud Carbon Footprint.
                        </div>
                    </div>
                </div>

                <!-- Fifth accordion item
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
                </div> -->
            </div>
        </div>
    </div>
</layout:page-container>
