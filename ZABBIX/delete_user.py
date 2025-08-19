from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix.url/api_jsonrpc.php'
zabbix_user = 'username'
zabbix_password = 'password'

# Logging
zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

# Get user ID login_name
users = zapi.user.get(filter={'username': 'test'})
if not users:
    print("User 'test' not existing or already removed.")
else:
    test_id = users[0]['userid']
    # Remove user
    zapi.user.delete(test_id)
    print("User 'test' removed.")

print("Ready.")

