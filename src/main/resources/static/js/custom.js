function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.getElementById("navbarTop").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
    document.getElementById("navbarTop").style.marginLeft = "0px";
}

//Toggles the navigation view
function toggleNav() {
    if (document.getElementById("mySidebar").style.width === "250px") {
        closeNav();
    } else {
        openNav();
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

//Colors used for charts
let chartColorAWS = "#FB9C38";
let chartColorAzure = "#3077B3";
let chartColorGCP = "#F14A3D";

let chartColorAWSDark = "#bf782c";
let chartColorAzureDark = "#1e517d";
let chartColorGCPDark = "#b3352b";

//Stores the current chart
//Used to fix a bug with overlapping charts
let currentChart1 = null;
let currentChart2 = null;
let currentChart3 = null;

//Defines the first active chart as chart1
let activeChartId = "chart1"

//Generate a chart with the chartId (1-3)
//If there is not enough data, display an info alert
function getChartData() {
    //Find active chart tab and active timeframe tab
    let activeChartIdCurr = $('.nav-tabs .active').attr("href");
    if (typeof activeChartIdCurr != "undefined") {
        activeChartId = activeChartIdCurr.substring(1, 7)
    }
    console.log(activeChartId)

    let url = "http://localhost:8080/chartdata/"
    let ctx = null;
    let activeChart = null;

    $.get(url, function (data, status) {
        if (data.length === 0 || status === "error" || status === "timeout" || status === "parsererror") {
            replaceWithEmptyChartMessage(activeChartId);
            return;
        } else {
            activeChart = document.getElementById(activeChartId);

            if (activeChart == null) {
                createChartCanvas(activeChartId);
                activeChart = document.getElementById(activeChartId);
            }
            ctx = activeChart.getContext("2d")
            console.log(ctx)
        }
        data = data.filter(checkSoftwareUsed)
        let software = data.filter(checkaws).map(a => a.usedSoftware)

        let awsco2 = data.filter(checkaws).map(a => a.co2e);
        let azureco2 = data.filter(checkazure).map(a => a.co2e);
        let gcpco2 = data.filter(checkgcp).map(a => a.co2e);

        let awskwh = data.filter(checkaws).map(a => a.kilowattHours);
        let azurekwh = data.filter(checkazure).map(a => a.kilowattHours);
        let gcpkwh = data.filter(checkgcp).map(a => a.kilowattHours);

        let awscost = data.filter(checkaws).map(a => a.cost);
        let azurecost = data.filter(checkazure).map(a => a.cost);
        let gcpcost = data.filter(checkgcp).map(a => a.cost);

        switch (activeChartId) {
            case "chart1" : {
                const dataUsed = {
                    labels: software,
                    datasets: [
                        {
                            label: 'GCP',
                            data: gcpco2,
                            backgroundColor: chartColorGCP,
                        },
                        {
                            label: 'AWS',
                            data: awsco2,
                            backgroundColor: chartColorAWS,
                        },
                        {
                            label: 'Azure',
                            data: azureco2,
                            backgroundColor: chartColorAzure,
                        }
                    ]
                };

                if (currentChart1 != null) {
                    currentChart1.destroy();
                }
                currentChart1 = new Chart(ctx, {
                    type: 'bar',
                    data: dataUsed,
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                labels: {
                                    font: {
                                        size: 18,
                                    }
                                },
                                position: 'bottom',
                            },
                            title: {
                                display: true,
                                font: {
                                    size:30,
                                },
                                text: 'CO2 Emissions In Tons'
                            },
                            tooltip: {
                                callbacks: {
                                    label: (item) => //TODO Are tons used?
                                        `${item.dataset.label}: ${item.formattedValue} tons`,
                                }
                            }
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    },
                })
                break;
            }
            case "chart2" : {
                const dataUsed = {
                    labels: software,
                    datasets: [
                        {
                            label: 'GCP',
                            data: gcpkwh,
                            backgroundColor: chartColorGCP,
                        },
                        {
                            label: 'AWS',
                            data: awskwh,
                            backgroundColor: chartColorAWS,
                        },
                        {
                            label: 'Azure',
                            data: azurekwh,
                            backgroundColor: chartColorAzure,
                        }
                    ]
                };

                if (currentChart2 != null) {
                    currentChart2.destroy();
                }
                currentChart2 = new Chart(ctx, {
                    type: 'bar',
                    data: dataUsed,
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                labels: {
                                    font: {
                                        size: 18,
                                    }
                                },
                                position: 'bottom',
                            },
                            title: {
                                display: true,
                                font: {
                                    size:30,
                                },
                                text: 'Kilowatt Hours Used'
                            },
                            tooltip: {
                                callbacks: {
                                    label: (item) =>
                                        `${item.dataset.label}: ${item.formattedValue} kwh`,
                                }
                            }
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    },
                })
                console.log(currentChart2);
                break;
            }
            case "chart3" : {
                const dataUsed = {
                    labels: software,
                    datasets: [
                        {
                            label: 'GCP',
                            data: gcpcost,
                            backgroundColor: chartColorGCP,
                        },
                        {
                            label: 'AWS',
                            data: awscost,
                            backgroundColor: chartColorAWS,
                        },
                        {
                            label: 'Azure',
                            data: azurecost,
                            backgroundColor: chartColorAzure,
                        }
                    ]
                };

                if (currentChart3 != null) {
                    currentChart3.destroy();
                }
                currentChart3 = new Chart(ctx, {
                    type: 'bar',
                    data: dataUsed,
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                labels: {
                                    font: {
                                        size: 18,
                                    }
                                },
                                position: 'bottom',
                            },
                            title: {
                                display: true,
                                font: {
                                    size:30,
                                },
                                text: 'Costs in $'
                            },
                            tooltip: {
                                callbacks: {
                                    label: (item) =>
                                        `${item.dataset.label}: ${item.formattedValue} $`,
                                }
                            }
                        },
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    },
                })
                break;
            }
        }
    });


}

//Replace the currently displayed chart with a "no data message"
function replaceWithEmptyChartMessage(chartId) {
    let chart = document.getElementById(chartId);
    let chartParentPane = document.getElementById(chartId + "Pane");
    let emptyChartMessage = document.createElement("div");
    emptyChartMessage.className = "alert alert-info"
    emptyChartMessage.innerHTML = "Not enough data to display statistics.";
    emptyChartMessage.id = chartId + "Empty";
    if (chart != null) {
        chartParentPane.replaceChild(emptyChartMessage, chart);
    }
}

//Replace the "no data message" with the corresponding chart again
function createChartCanvas(chartId) {
    let chartParentPane = document.getElementById(chartId + "Pane");
    let newChartCanvas = document.createElement("canvas");
    let emptyChartMessage = document.getElementById(chartId + "Empty");
    newChartCanvas.id = chartId;
    newChartCanvas.style.width = "100%";
    newChartCanvas.style.maxWidth = "1000px";
    newChartCanvas.style.margin = "auto";
    chartParentPane.replaceChild(newChartCanvas, emptyChartMessage);
}

function checkaws(data) {
    return data.cloudProvider === "AWS"
}

function checkazure(data) {
    return data.cloudProvider === "AZURE"
}

function checkgcp(data) {
    return data.cloudProvider === "GCP"
}

function checkSoftwareUsed(data) {
    return data.usedSoftware !== ""
}






