# Python Examples

In this examples we'll be using
[requests](http://docs.python-requests.org/en/master/) as a HTTP client
library, it is a powerful and simple library for making requests with python.

## Interacting with InterSCity

First of all, import the requests library

```python
import 'requests'

```

### Listing all the capababilities registered in the platform

- You can use this to find out what kind of data is already available to you.
But you can then insert your own data if you want.

```python

requests.get('http://143.107.45.126:30134/catalog/capabilities')

      RESPONSE:
      {
          "capabilities": [
              {
                  "id": 1,
                  "name": "bus_monitoring",
                  "function": 0,
                  "description": "Provides data related to a bus, such as its current location"
              },
              {
                  "id": 5,
                  "name": "temperature",
                  "function": 0,
                  "description": "temperature of a given region, in fahrenheit"
              },
              {
                  "id": 6,
                  "name": "wind_speed",
                  "function": 0,
                  "description": "wind speed of a given region, in mph"
              },
              {
                  "id": 7,
                  "name": "humidity",
                  "function": 0,
                  "description": "humidity of a given region, in percentage"
              },
              {
                  "id": 8,
                  "name": "pressure",
                  "function": 0,
                  "description": "pressure of a given region, in pol"
              }
      }
```

### Fetching data from a specific sensor given its uuid

```python
uuid = '2fb06b91-9e2a-4a65-9689-dee9c4f326db'

requests.post('http://143.107.45.126:30134/collector/resources/' + uuid + '/data, json={limit: 2})
```

## Filters

There are some filters that can be applied and combined to your requests. You just
need to add them to the request url.

- **capabilities**: Only fetches data related to a given capabilities
- **start_date**: Only fetches data collected after the start_date
- **end_date**: Only fetches data collected before the end_date
- **limit**: Limit the amount of registers in the response
- **start**: Used for pagination purpouses

### Fetching measures from a given capability

- You may need to filter the collected measures by the capability of interest,
for example, weather.

```python

requests.post('http://143.107.45.126:30134/collector/resources/data', json={"capabilities": ["weather"]} )
```

### Fetching measures between specific datetime

- You can **filter by start_date, end_date**

```python
requests.post('http://143.107.45.126:30134/collector/resources/data', json={'capabilities': ['weather'], 'start_date': '2017-11-09T23:46:29.000Z'})
```


### Limit and Start

```python
requests.post('http://143.107.45.126:30134/collector/resources/data', json={'capabilities': ['weather'], 'start_date': '2017-11-09T23:46:29.000Z'. 'limit': 100, 'start': 3})
```

## Extra information

In this directory you can find an example of a get and post fuctions
implementations to facilitate your interaction with the InterSCity platform.
Enjoy it!
