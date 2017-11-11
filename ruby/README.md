# Ruby Examples

In this examples we'll be using
[rest-client](https://github.com/rest-client/rest-client) as a HTTP REST client
library, it is a powerful and simple library for making requests with ruby.

## Dependency installation

```$ gem install rest-client```

In a Debian derivative distribution you can execute de following command:

```$ apt-get install ruby-rest-client```

## Interacting with InterSCity

First of all, require rest-client after gathering it from rubygems or other
source.

```ruby
require 'rest-client'

```

### Listing all the capababilities registered in the platform

- You can use this to find out what kind of data is already available to you.
But you can then insert your own data if you want.

```ruby

RestClient.get('http://143.107.45.126:30134/catalog/capabilities')

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

```ruby
uuid = '2fb06b91-9e2a-4a65-9689-dee9c4f326db'

RestClient.post('http://143.107.45.126:30134/collector/resources/' + uuid + '/data?limit=2)
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

```ruby

RestClient.post('http://143.107.45.126:30134/collector/resources/data', {"capabilities": ["weather"]}.to_json )
```

### Fetching measures between specific datetime

- You can **filter by start_date, end_date**

```ruby
RestClient.post('http://143.107.45.126:30134/collector/resources/data', {'capabilities': ['weather'], 'start_date': '2017-11-09T23:46:29.000Z'}.to_json)
```


### Limit and Start

```ruby
RestClient.post('http://143.107.45.126:30134/collector/resources/data', {'capabilities': ['weather'], 'start_date': '2017-11-09T23:46:29.000Z'. 'limit': 100, 'start': 3}.to_json)
```

## Extra information

In this directory you can find an example of a get and post fuctions
implementations to facilitate your interaction with the InterSCity platform.
Enjoy it!
