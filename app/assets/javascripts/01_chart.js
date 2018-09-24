google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
    // Some raw data (not necessarily accurate)
    var stock_price = $('.stock_price').val();
    var data_array = new Array();

    // Convert String to array
    stock_price.slice(2).slice(0,-2).replace(/ /g,"").replace(/"/g,"").split("],[").forEach(
        function(value){
            var array = value.split(",");
            if(!array[0].match(/^[A-Za-z_]*$/)){
                array = array.map(function (element) { return Number(element); });
            }
            data_array.push(array)
        }
    );


    console.dir(data_array);
    var data = google.visualization.arrayToDataTable(data_array);

    var options = {
        title : 'Monthly Coffee Production by Country',
        vAxis: {title: 'current_price'},
        hAxis: {title: 'id'},
        seriesType: 'line'
    };
    
    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}

