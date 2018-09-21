require 'httpclient'
require 'json'

class Bland < ApplicationRecord
    apiServerIp = '192.168.0.21'
    apiServerPort = 5000
    baseUrl = 'http://' + apiServerIp + ':' + apiServerPort + '/api/'

    def myfind(bland_cd)
        client = HTTPClient.new
        header = [["Content-Type", "application/json"]]
        # Output debugging information with standard error.
        client.debug_dev = $stderr
        
        # Get request
        res = client.get(baseUrl + bland_cd, header: header).body
        
        # It converts the acquired JSON into a hash of using Symbol and returns it.
        return JSON.parse(res).symbolize_keys
    end
end