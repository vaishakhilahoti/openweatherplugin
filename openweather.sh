#!/bin/bash

    a=lat
    b=lon
    c=APIkey
    d=Unit_imperial_or_metric
    
curl -s "https://api.openweathermap.org/data/3.0/onecall?lat=$a&lon=$b&appid=$c&units=$d&exclude=minutely,hourly,daily,alerts" \
| jq -r '
.current as $c
| ($c.weather[0].description // "" | gsub("\""; "\\\"")) as $desc
| "weather,lat=\(.lat),lon=\(.lon) " +
  "condition_id=\($c.weather[0].id)i," +
  "temperature=\($c.temp)," +
  "feels_like=\($c.feels_like)," +
  "pressure=\($c.pressure)i," +
  "humidity=\($c.humidity)i," +
  "dew_point=\($c.dew_point)," +
  "uvi=\($c.uvi)," +
  "cloudiness=\($c.clouds)i," +
  "wind_speed=\($c.wind_speed)," +
  "wind_deg=\($c.wind_deg)i," +
  "condition_description=\"\($desc)\" " +
  "\($c.dt * 1000000000)"
'
