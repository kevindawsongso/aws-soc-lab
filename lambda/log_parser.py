import json
import gzip
import base64
import requests

def lambda_handler(event, context):
    output = []
    geoip_lookup_url = "http://ip-api.com/json/{}"

    for record in event['records']:
        payload = base64.b64decode(record['data'])
        log_event = json.loads(payload)

        message = log_event.get("message", "")
        if "4625" in message:  # Windows failed login
            ip = extract_ip(message)
            if ip:
                geo = requests.get(geoip_lookup_url.format(ip)).json()
                enriched = {
                    "event": "failed_login",
                    "source_ip": ip,
                    "country": geo.get("country"),
                    "city": geo.get("city"),
                    "lat": geo.get("lat"),
                    "lon": geo.get("lon"),
                    "raw_message": message
                }
                output.append(json.dumps(enriched))

    return {
        'records': [{'recordId': rec['recordId'], 'result': 'Ok', 'data': base64.b64encode(json.dumps(log).encode()).decode()} for rec, log in zip(event['records'], output)]
    }

def extract_ip(log_message):
    import re
    match = re.search(r'Source Network Address:\s+([\d\.]+)', log_message)
    return match.group(1) if match else None