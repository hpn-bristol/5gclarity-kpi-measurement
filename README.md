#University Of Bristol, Smart Internet Lab, 5GCLARITY-Project

The following scripts are developed to be able to grab the logs related to WiFi and LiFi and determine the connection re-establishment time for each technology.
To use, make the environment ready. It means be at the border of WiFi or LiFi coverage.
-	Run start_logging.sh to start logging procedure, the move the CPE out of the coverage and return it back.
-	Run stop_logging.sh to stop generating logs.
-	Use Date-converter.sh to convert standard time to Unix epoch with millisecond accuracy for postprocessing data.
-	Postprocess data and extract the requiered informaiton based on following Events:
	 - Link UP/DOWN
	 - Lost carrier
	 - Gained carrier
	 - Connected WiFi access point:
	 - DHCPv4 address xx.xx.xx.xx/xx via xx.xx.xx.xx
	 - First packet arrived on the coresponding interface over MPTCP
