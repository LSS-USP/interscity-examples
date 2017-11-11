
# Javascript Examples

In this examples we'll be using [axios](https://github.com/axios/axios) as a HTTP library, it is a powerful and
simple library for making requests with javascript.

First of all, require axios after gathering it from NPM, Bower, or CDN.
```javascript
axios = require('axios')

```

### Listing all the capababilities registered in the platform

- You can use this to find out what kind of data is already available to you.
But you can then insert your own data if you want.

```javascript

axios.get('http://143.107.45.126:30134/catalog/capabilities')
     .then((response) => console.log(response.data))
     .catch((err) => console.log(error))

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

```javascript
uuid = '2fb06b91-9e2a-4a65-9689-dee9c4f326db'

axios.post('http://143.107.45.126:30134/collector/resources/' + uuid + '/data?limit=2'
     .then((response) => console.log(response.data))
     .catch((err) => console.log(error))

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

```javascript

axios.post('http://143.107.45.126:30134/collector/resources/data?&capabilities[]=weather')
     .then((response) => console.log(response.data))
     .catch((err) => console.log(error))
```

### Fetching measures between specific datetime

- You can **filter by start_date, end_date**

```javascript
axios.post('http://143.107.45.126:30134/collector/resources/data?&capabilities[]=weather&start_date=2017-11-09T23:46:29.000Z')
     .then((response) => console.log(response.data))
     .catch((err) => console.log(error))
```


### Limit and Start

```javascript
axios.post('http://143.107.45.126:30134/collector/resources/data?&capabilities[]=weather&start_date=2017-11-09T23:46:29.000Z&limit=100&start=3')
     .then((response) => console.log(response.data))
     .catch((err) => console.log(error))
```
