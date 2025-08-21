from pyzabbix import ZabbixAPI

zabbix_url = 'http://10.16.92.101/zabbix/api_jsonrpc.php'
zabbix_user = 'dawid.wrobel@damovo.com'
zabbix_password = 'Zabbix123?'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

user_input = input("Enter the names of users to be deleted, separated by commas: ")
usernames_to_delete = [u.strip() for u in user_input.split(',')]

for username in usernames_to_delete:
    users = zapi.user.get(filter={'username': username})
    if users:
        user_id = users[0]['userid']
        zapi.user.delete(user_id)
        print(f"User {username} removed.")
    else:
        print(f"User {username} not existing or already removed.")
