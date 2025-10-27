This script will process a list of logs containing servicename and its timestamp. Expectation is to keep the most recent timestamp for the service.

In order to work with date and time, I have imported datetime module. This script will iterates through each service and converts the timestamp string into timestamp object. Implemented exception handling, when the service not present in the dictionary it will add to it and if the service is already present it will update with more recent timestamp.

Run the script using 
python logparsing.py

The results will be printed like the below,

/PyCharmMiscProject/.venv/bin/python /PyCharmMiscProject/script.py 
Latest log per service:
auth: 2023-04-20 07:30:25
api: 2023-04-20 07:30:15
db: 2023-04-20 07:29:55
