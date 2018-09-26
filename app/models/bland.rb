require 'httpclient'
require 'json'

class Bland
    @@apiServerIp = '172.30.20.1'
    @@apiServerPort = '30005'
    @@baseUrl = 'http://' + @@apiServerIp + ':' + @@apiServerPort

    def self.getBland(bland_cd)
        client = HTTPClient.new
        header = [['Content-Type', 'application/json']]
        url = @@baseUrl + '/api/bland/'
        # Output debugging information with standard error.
        # client.debug_dev = $stderr

        # Get request
        res = client.get(url + bland_cd + '/', header: header).body

        # It converts the acquired JSON into a hash of using Symbol and returns it.
        return JSON.parse(res, symbolize_names: true)
    end

    def self.getStockPrice(bland_cd,size)
        client = HTTPClient.new
        header = [['Content-Type', 'application/json']]
        url = @@baseUrl + '/api/stockprice/?q=' + bland_cd + '&limit=' + size.to_s
        # Output debugging information with standard error.
        # client.debug_dev = $stderr

        # Get request
        res = client.get(url, header: header).body

        # It converts the acquired JSON into a hash of using Symbol and returns it.
        return JSON.parse(res)
    end
    
    def self.selectStockPriceForGoogleChart(bland_cd,size,column_indexes)
        # Get stock price REST for results.
        stock_price_hash = self.getStockPrice(bland_cd,size)

        # Convert a hash of a symbol to an array.
        array = [['id','market_prod_cls','current_price','day_before_ratio','opening_price','high_orice','low_price','sales_volume','created_at','bland_cd']]
        for record in stock_price_hash["results"]
            record["created_at"] = record["created_at"].gsub(/[^\d]/, "")
            array.push(record.values)
        end
        
        # Select columns from array        
        selected_array = Array.new()
        for record in array
          selected_record = Array.new()
          for index in column_indexes
            selected_record.push(record[index])
          end
          selected_array.push(selected_record)
        end

        return selected_array
    end
    
    def self.selectStockPriceForChartJs(bland_cd,size)
        # Get stock price REST for results.
        stock_price_hash = self.getStockPrice(bland_cd,size)

        # Perform matrix transformation of the acquired hash.
        result_array = Array.new()
        for record in stock_price_hash["results"]
            result_array.push(record.values)
        end
        result_array = result_array.transpose

        return result_array
    end
    
end



