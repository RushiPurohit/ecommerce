$(function () {
    if (document.getElementById("line_chart"))
        new Chart(document.getElementById("line_chart").getContext("2d"), getChartJs('line'));    
    if (document.getElementById("bar_chart"))
        new Chart(document.getElementById("bar_chart").getContext("2d"), getChartJs('bar'));
    if (document.getElementById("radar_chart"))
        new Chart(document.getElementById("radar_chart").getContext("2d"), getChartJs('radar'));
    if (document.getElementById("pie_chart"))
        new Chart(document.getElementById("pie_chart").getContext("2d"), getChartJs('pie'));
});

function getChartJs(type) {
    var config = null;

    if (type === 'line') {
        config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [{
                    label: "My First dataset",
                    data: [65, 59, 80, 81, 56, 55, 40],
                    borderColor: 'rgba(0, 188, 212, 0.75)',
                    backgroundColor: 'rgba(0, 188, 212, 0.3)',
                    pointBorderColor: 'rgba(0, 188, 212, 0)',
                    pointBackgroundColor: 'rgba(0, 188, 212, 0.9)',
                    pointBorderWidth: 1
                }, {
                        label: "My Second dataset",
                        data: [28, 48, 40, 19, 86, 27, 90],
                        borderColor: 'rgba(233, 30, 99, 0.75)',
                        backgroundColor: 'rgba(233, 30, 99, 0.3)',
                        pointBorderColor: 'rgba(233, 30, 99, 0)',
                        pointBackgroundColor: 'rgba(233, 30, 99, 0.9)',
                        pointBorderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
    else if (type === 'bar') {
        var sales = document.getElementById('sales').value
        var saleArray = JSON.parse(sales)
        var month = []
        var totalOrder = []
        var totalAmount = []
        saleArray.forEach(element => {
            month.push(element.new_date)
            totalOrder.push(element.total_order)
            totalAmount.push(element.grand_total)
        });
        config = {
            type: 'bar',
            data: {
                labels: month,
                datasets: [
                    {
                        label: "Sale Amount",
                        data: totalAmount,
                        backgroundColor: 'rgba(0, 188, 212, 0.8)'
                    }, 
                    {
                        label: "Total Order",
                        data: totalOrder,
                        backgroundColor: 'rgba(233, 30, 99, 0.8)'
                    }
                ]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
    else if (type === 'radar') {
        config = {
            type: 'radar',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [{
                    label: "My First dataset",
                    data: [65, 25, 90, 81, 56, 55, 40],
                    borderColor: 'rgba(0, 188, 212, 0.8)',
                    backgroundColor: 'rgba(0, 188, 212, 0.5)',
                    pointBorderColor: 'rgba(0, 188, 212, 0)',
                    pointBackgroundColor: 'rgba(0, 188, 212, 0.8)',
                    pointBorderWidth: 1
                }, {
                        label: "My Second dataset",
                        data: [72, 48, 40, 19, 96, 27, 100],
                        borderColor: 'rgba(233, 30, 99, 0.8)',
                        backgroundColor: 'rgba(233, 30, 99, 0.5)',
                        pointBorderColor: 'rgba(233, 30, 99, 0)',
                        pointBackgroundColor: 'rgba(233, 30, 99, 0.8)',
                        pointBorderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
    else if (type === 'pie') {
        var sales = document.getElementById('panymentChart').value
        var saleArray = JSON.parse(sales)
        var month = []
        var cash = []
        var card = []
        saleArray.forEach(element => {
            console.log(element.card, element.cash)
            cash = element.cash
            card = element.card
        });
        config = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [cash, card],
                    backgroundColor: [
                        "rgb(233, 30, 99)",
                        "rgb(255, 193, 7)",
                        "rgb(0, 188, 212)",
                        "rgb(139, 195, 74)"
                    ],
                }],
                labels: ['Cash', 'Card']
            },
            options: {
                responsive: true,
                legend: false
            }
        }
    }
    return config;
}