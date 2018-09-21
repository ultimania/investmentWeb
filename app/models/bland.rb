require 'httpclient'
require 'json'

class Bland
    @@apiServerIp = '172.30.20.1'
    @@apiServerPort = '30005'
    @@baseUrl = 'http://' + @@apiServerIp + ':' + @@apiServerPort + '/api/bland/'

    def self.myfind(bland_cd)
        client = HTTPClient.new
        header = [["Content-Type", "application/json"]]
        # Output debugging information with standard error.
        # client.debug_dev = $stderr

        # Get request
        res = client.get(@@baseUrl + bland_cd + '/', header: header).body

        # It converts the acquired JSON into a hash of using Symbol and returns it.
        return JSON.parse(res, symbolize_names: true)
    end
end