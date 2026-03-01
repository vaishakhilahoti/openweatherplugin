# openweatherplugin
Bash script to ingest Openweathermap API 3.0 into telegraf using the exec input function. 
Set up the telegraf conf file with the following set up
[[inputs.exec]]
commands = ["sh openweather.sh"]
timeout = "5s"
data_format = "influx"
interval = "60m"


Insert your own API key and co-ordinates in the conf file
