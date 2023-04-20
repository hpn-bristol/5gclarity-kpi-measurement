#University Of Bristol, Smart Internet Lab, 5GCLARITY-Project

The following scripts are developed to be able to grab the logs related to WiFi and LiFi and determine the connection re-establishment time for each technology.
To use, make the environment ready. It means be at the border of WiFi or LiFi coverage.
-	Run start_logging.sh to start logging procedure, the move the CPE out of the coverage and return it back.
-	Run stop_logging.sh to stop generating logs.
-	Use Date-converter.sh to convert standard time to Unix epoch with millisecond accuracy for postprocessing data.
