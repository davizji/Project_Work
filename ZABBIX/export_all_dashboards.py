# This script is for export all dashboards.
from pyzabbix import ZabbixAPI
import pandas as pd

zabbix_url = 'zabbix_url/zabbix/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

zapi = ZabbixAPI(zabbix_url)
zapi.login(zabbix_user, zabbix_password)

dashboards = zapi.dashboard.get()

data = [{"DashboardID": d["dashboardid"], "Name": d["name"]} for d in dashboards]
df = pd.DataFrame(data)

excel_filename = "zabbix_dashboards_list.xlsx"
df.to_excel(excel_filename, index=False)

print(f"Found {len(dashboards)} dashboards.")
print(f"List of dashboards saved to a file: {excel_filename}")
