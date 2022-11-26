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
let chartColors1 = [
    "#9e0142",
    "#d53e4f",
    "#f46d43",
    "#fdae61",
    "#fee08b",
    "#e6f598",
    "#abdda4",
    "#66c2a5",
    "#3288bd",
    "#5e4fa2"
];
let chartColors1Inv = chartColors1.slice().reverse();

//Stores the current chart
//Used to fix a bug with overlapping charts
let currentChart1 = null;
let currentChart2 = null;
let currentChart3 = null;

//Defines the first active chart as chart1
let activeChartId = "chart1"

//Generate a chart with the chartId (1-3) and the date limit (all;year;month;day)
//If there is not enough data, display an info alert
function getChartData() {
    //Find active chart tab and active timeframe tab
    let activeChartIdCurr = $('.nav-tabs .active').attr("href");
    if (typeof activeChartIdCurr != "undefined") {
        activeChartId = activeChartIdCurr.substring(1,7)
    }
    let activeTimeFrame = $('input[type=radio]:checked', '#timeFrameNav').attr("id")
    activeTimeFrame = activeTimeFrame.substring(12,activeTimeFrame.length);

    let url = "http://localhost:8080/chartdata/" + activeChartId + "/" + activeTimeFrame
    let ctx = null;

    switch(activeChartId) {
        case "chart1" : { //Highest cost entries this timeframe as piechart
            $.get(url, function (data, status) {
                if (data.length === 0 || status === "error" || status === "timeout" || status === "parsererror") {
                    replaceWithEmptyChartMessage(activeChartId);
                    return;
                } else {
                    let activeChart = document.getElementById(activeChartId);

                    if (activeChart == null) {
                        createChartCanvas(activeChartId);
                        activeChart = document.getElementById(activeChartId);
                    }
                    ctx = activeChart.getContext("2d")
                }
                let names = data.map(a => a.name);
                let prices = data.map(a => (Math.round(a.price*100)/100).toFixed(2));

                if(currentChart1!=null){currentChart1.destroy();}
                currentChart1 = new Chart(ctx, {
                    type: "pie",
                    data: {
                        labels: names,
                        datasets: [{
                            backgroundColor: chartColors1,
                            data: prices
                        }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Highest cost entries this " + activeTimeFrame,
                            fontSize: 30
                        }
                    }
                });
            });
            break;
        }
        case "chart2" : { //Cost per day this timeframe as linechart
            $.get(url, function (data, status) {
                if (data.length === 0 || status === "error" || status === "timeout" || status === "parsererror") {
                    replaceWithEmptyChartMessage(activeChartId);
                    return;
                } else {
                    let activeChart = document.getElementById(activeChartId);

                    if (activeChart == null) {
                        createChartCanvas(activeChartId);
                        activeChart = document.getElementById(activeChartId);
                    }
                    ctx = activeChart.getContext("2d")
                }
                var result = [];
                data.reduce(function (res, value) {
                    if (!res[value.date]) {
                        res[value.date] = {
                            price: 0,
                            date: value.date
                        };
                        result.push(res[value.date])
                    }
                    res[value.date].price += value.price
                    return res;
                }, {});

                finalResult = result.sort(function(a,b){
                    return new Date(b.date) - new Date(a.date);
                }).reverse();

                let dates = finalResult.map(a => a.date);
                let prices = finalResult.map(a => (Math.round(a.price*100)/100).toFixed(2));

                if(currentChart2!=null){currentChart2.destroy();}
                colorRandom = chartColors1[getRandomInt(9)]
                currentChart2 = new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: dates,
                        datasets: [{
                            label: "Costs",
                            backgroundColor: colorRandom,
                            borderColor: "#000000",
                            data: prices,
                            tension: 0.2,
                            fill: true,
                            borderWidth: 2,
                            drawActiveElementsOnTop: true,
                            datalabels: {
                                color: '#FFCE56'
                            }
                        }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Cost per day this " + activeTimeFrame,
                            fontSize: 30
                        },
                    }
                });
            });
            break;
        }
        case "chart3" : { //Cost per member this timeframe as doughnutchart
            $.get(url, function (data, status) {
                if (data.length === 0 || status === "error" || status === "timeout" || status === "parsererror") {
                    replaceWithEmptyChartMessage(activeChartId);
                    return;
                } else {
                    let activeChart = document.getElementById(activeChartId);
                    if (activeChart == null) {
                        createChartCanvas(activeChartId);
                        activeChart = document.getElementById(activeChartId);
                    }
                    ctx = activeChart.getContext("2d")
                }
                var result = [];
                data.reduce(function (res, value) {
                    if (!res[value.creator]) {
                        res[value.creator] = {
                            price: 0,
                            creator: value.creator
                        };
                        result.push(res[value.creator])
                    }
                    res[value.creator].price += value.price
                    return res;
                }, {});

                let creators = result.map(a => a.creator);
                let prices = result.map(a => (Math.round(a.price*100)/100).toFixed(2));

                if(currentChart3!=null){currentChart3.destroy();}
                colorRandom = chartColors1
                currentChart3 = new Chart(ctx, {
                    type: "doughnut",
                    data: {
                        labels: creators,
                        datasets: [{
                            backgroundColor: chartColors1Inv,
                            data: prices
                        }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Cost per member this " + activeTimeFrame,
                            fontSize: 30
                        }
                    }
                });
            });
            break;
        }
    }
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






