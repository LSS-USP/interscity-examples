import requests
import json
import os

platform_hostname = os.environ.get('INTERSCITY_HOSTNAME', 'localhost:8000')

def get(path, **params):
    '''
    Receives a dictionary that contains the service's path and the get request
    parameters and returns the InterSCity platform response in JSON format
    '''

    query = '?'
    if params is not None:
        for key, value in params.items():
            query += ( key + '=' + value )

    url = platform_hostname + path + query
    response = requests.get(url)
    return json.loads(response.text)

def post(path, **params):
    '''
    Receives a dictionary that contains the service's path and the post request
    parameters and returns the InterSCity platform response in JSON format
    '''

    url = platform_hostname + path
    if params is not None:
        response = requests.post(url, json=params)
    else:
        response = requests.post(url, json={})

    return json.loads(response.text)

#discoverer_path = '/discovery/resources'
#data = get(discoverer_path, capability="bus_line_metadata")
#print data["resources"][0]

#collector_path = '/collector/resources/a821fc2e-9eb0-44d7-8d19-1fecdb4e1c80/data/last'
#data = post(collector_path, capabilities=["bus_line_monitoring"])
#print data
