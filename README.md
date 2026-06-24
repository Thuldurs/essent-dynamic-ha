# essent-dynamic-ha
YAML setup for Essent dynamic pricing in HA.

Here is some YAML to create dynamic pricing sensors in HA.
I've created this together with Claude.ai for my own setup and wanted to share. This is as-is, use it at your own insight. 
The basics is that the API is read every hour and saved to file. A cache is then created to store prices. On the top of the hour, the cache is refreshed and all related templates update. 
