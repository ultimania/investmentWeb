window.onload = function() {
    // Variable definition
    var stock_price ;
    var data_array = new Array();

    // Obtain data of rails-model via "input" element of rails-view.
    stock_price = $('.stock_price').val();

    // Convert String to array
    stock_price.slice(2).slice(0,-2).replace(/ /g,"").replace(/"/g,"").split("],[").forEach(
        function(value){
            var array = value.split(",");
            /* If the array's element contains an alphabetic character, 
             * do not perform Float conversion.                        */
            if(array[0].match(/^[0-9.]*$/))
                array = array.map(function (element) { return parseFloat(element); });
            data_array.push(array)
        }
    );

    // Create Chart DataSet
    var barChartData = {
        labels: data_array[8],
        datasets: [
        {
            type: 'line',
            label: 'current_price',
            data: data_array[2],
            borderColor : "rgba(254,97,132,0.8)",
                    pointBackgroundColor    : "rgba(254,97,132,0.8)",
                    fill: false,
            yAxisID: "y-axis-1",
        },
        {
            type: 'bar',
            label: 'sales_volume',
            data: data_array[7],
            borderColor : "rgba(54,164,235,0.8)",
            backgroundColor : "rgba(54,164,235,0.5)",
            yAxisID: "y-axis-2",
        },
        ],
    };

    // Create Chart Option
    var complexChartOption = {
        responsive: true,
        scales: {
            yAxes: [{
                id: "y-axis-1",
                type: "linear", 
                position: "left",
                ticks: {
                    max: Math.max(...data_array[2]),
                    min: 0,
                    stepSize: Math.max(...data_array[2])/10
                },
            }, {
                id: "y-axis-2",
                type: "linear", 
                position: "right",
                ticks: {
                    max: Math.max(...data_array[7]),
                    min: 0,
                    stepSize: Math.max(...data_array[7])/10
                },
                gridLines: {
                    drawOnChartArea: false, 
                },
            }],
        }
    };


    // Draw Chart
    ctx = document.getElementById("chart_div").getContext("2d");
    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: complexChartOption
    });
};



