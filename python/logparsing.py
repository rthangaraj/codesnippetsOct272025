import datetime

def get_latest_logs(logs):
    latest = {}

    for service, ts in logs:
        try:
            timestamp = datetime.datetime.strptime(ts, "%Y-%m-%d %H:%M:%S")
        except ValueError:
            continue  

        if service not in latest or timestamp > latest[service]:
            latest[service] = timestamp

    return latest

# This part runs only when the script is executed directly
if __name__ == "__main__":
    logs = [
        ("auth", "2023-04-20 07:30:00"),
        ("api", "2023-04-20 07:30:10"),
        ("auth", "2023-04-20 07:30:25"),
        ("db", "2023-04-20 07:29:55"),
        ("api", "2023-04-20 07:30:15"),
        ("auth", "2023-04-20 07:30:11")
    ]

    latest_logs = get_latest_logs(logs)

    print("Latest log per service:")
    for service, ts in latest_logs.items():
        print(service + ": " + ts.strftime('%Y-%m-%d %H:%M:%S'))

