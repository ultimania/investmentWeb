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
            // If the test element contains an alphabetic character, do not perform integer conversion. 
            if(!array[0].match(/[A-Za-z_:#]/))
            {
                array = array.map(function (element) { return Number(element); });
            }
            /*
             * If "T" is detected as the 10th character by searching for an alphabetic character,
             * it is regarded as date data and it is converted to date type.
             */
            else if((array[0].match(/[A-Za-z_:#]/)[0] == "T") && (array[0].match(/[A-Za-z_:#]/)["index"] == 10))
            {
                array = array.map(function (element) { return Date(element); });
            }
            data_array.push(array)
        }
    );

    console.dir(data_array);
    var data = google.visualization.arrayToDataTable(data_array);

    var options = {
        title : 'Monthly Coffee Production by Country',
        vAxis: {title: 'current_price'},
        hAxis: {title: 'created_at'},
        seriesType: 'line'
    };
    
    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}
