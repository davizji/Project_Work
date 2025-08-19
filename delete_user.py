from pyzabbix import ZabbixAPI

zabbix_url = 'https://eventmgt11.damovo.de/api_jsonrpc.php'
zabbix_user = 'dawid.wrobel@damovo.com'
zabbix_password = 'Zabbix123?'

# Logowanie
zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

# Pobierz ID użytkownika decare1
users = zapi.user.get(filter={'username': 'decare1'})
if not users:
    print("Użytkownik 'decare1' nie istnieje lub już został usunięty.")
else:
    decare1_id = users[0]['userid']
    # Usuń użytkownika
    zapi.user.delete(decare1_id)
    print("Użytkownik 'decare1' został usunięty.")

print("Gotowe.")