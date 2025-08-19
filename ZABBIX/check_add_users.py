from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix_url/zabbix/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

usernames_to_add = [    
    {'alias': 'test3', 'passwd': 'testtest123', 'usrgrps': [{"usrgrpid": "8"}]},
    {'alias': 'test4', 'passwd': 'testtest124', 'usrgrps': [{"usrgrpid": "8"}]},
    {'alias': 'test10', 'passwd': 'testtest125', 'usrgrps': [{"usrgrpid": "8"}]}]

for usernames in usernames_to_add:
    users = zapi.user.get(filter={'username':usernames['alias']})
    if users:
        print(f"User {usernames['alias']} are existing")
    else:
        zapi.user.create(
                username=usernames['alias'],
                passwd=usernames['passwd'],
                usrgrps=usernames['usrgrps']
            )
        print(f"User {usernames['alias']} created")
