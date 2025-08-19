from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix_url/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

username = "test5"

users = zapi.user.get(filter={'username': username })
if not users:
    print(f"User {username} not existing or already removed.")
else:
    test_id = users[0]['userid']
    zapi.user.delete(test_id)
    print(f"User {username} removed.")

print("Ready.")
