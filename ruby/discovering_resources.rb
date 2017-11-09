# do not forget to install the rest-client gem before running this code
require 'rest-client'
require 'json'

platform_hostname = ENV['INTERSCITY_HOSTNAME'] || 'localhost:8000'

def get(host, path, params=nil)
    query = ''
    if params
		query = '?'
        params.each do | key, value |
            query += ( key.to_s + '=' + value.to_s )
		end
	end

    url = host + path + query
	response = RestClient.get url
    JSON.parse response.body
end

def post(host, path, params=[])
	url = host + path
	response = RestClient.post url, params.to_json	
	JSON.parse response.body
end

#discoverer_path = '/discovery/resources'
#data = get(platform_hostname, discoverer_path, {"capability": "bus_line_metadata"})
#print data["resources"][0]

#collector_path = '/collector/resources/a821fc2e-9eb0-44d7-8d19-1fecdb4e1c80/data/last'
#data = post(platform_hostname, collector_path, {"capabilities": ["bus_line_monitoring"]})
#print data
