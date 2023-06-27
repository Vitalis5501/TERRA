import requests

import json



# Set your Opsgenie API credentials

opsgenie_api_key = 'd863bd84-2574-4465-9860-6e2472a666e3'



# Set the request headers for Opsgenie

opsgenie_headers = {

    'Authorization': 'GenieKey {}'.format(opsgenie_api_key),

    'Content-Type': 'application/json'

}



# Set the request parameters for Opsgenie

opsgenie_params = {

    'limit': 10,

    'query': 'priority:P1 OR priority:P2 AND status:open'

}



# Send the GET request to fetch alerts from Opsgenie

opsgenie_response = requests.get('https://api.opsgenie.com/v2/alerts', headers=opsgenie_headers, params=opsgenie_params)



# Check the response status code

if opsgenie_response.status_code == 200:

    # Parse the JSON response

    opsgenie_data = json.loads(opsgenie_response.text)



    # Get a list of alerts

    alerts = opsgenie_data['data']



    # Filter and print only open P1 and P2 alerts

    for alert in alerts:

        if alert['priority'] in ['P1', 'P2'] and alert['status'] == 'open':

            alert_id = alert['id']

            alert_message = alert['message']

            alert_priority = alert['priority']



            print('Alert ID: {}'.format(alert_id))

            print('Message: {}'.format(alert_message))

            print('Priority: {}'.format(alert_priority))

            print('---------------------')

else:

    print('Failed to fetch alerts from Opsgenie. Status code: {}'.format(opsgenie_response.status_code))
