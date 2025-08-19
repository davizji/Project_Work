from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix.url/api_jsonrpc.php'
zabbix_user = 'username'
zabbix_password = 'password'

# Logging
zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

# Get user ID login_name
users = zapi.user.get(filter={'username': 'login_name'})
if not users:
    print("User 'login_name' not existing or already removed.")
else:
    login_name_id = users[0]['userid']
    # Remove user
    zapi.user.delete(login_name_id)
    print("User 'login_name' removed.")

print("Ready.")
