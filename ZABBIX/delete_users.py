from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix_url/zabbix/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

usernames_to_delete = ['test3', 'test4', 'test5']

for username in usernames_to_delete:
    users = zapi.user.get(filter={'username': username})
    if users:
        user_id = users[0]['userid']
        zapi.user.delete(user_id)
        print(f"User {username} removed.")
    else:
        print(f"User {username} not existing or already removed.")
