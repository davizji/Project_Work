from pyzabbix import ZabbixAPI

zabbix_url = 'zabbix_url/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

if zapi.login:
    print("Login OK")
else:
    print("Login Not OK")

username = "test5"
users = zapi.user.get(filter={'username':username})

if users:
    print("User existing")
    user_id = users[0]['userid']
else:
    print("Uzytkownik not existing - create user")
    create_user = zapi.user.create(
                username=username,
                passwd='testtest123',
                usrgrps=[{"usrgrpid": "8"}]
            )
    if create_user:
        print(f"User {username} created")
    else:
        print(f"User {username} NOT created")
