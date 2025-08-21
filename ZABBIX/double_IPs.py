# This script is used to fetch all hosts which have the same IP and save into excel.

from pyzabbix import ZabbixAPI
import pandas as pd

zabbix_url = 'zabbix_url/zabbix/api_jsonrpc.php'
zabbix_user = 'zabbix_user'
zabbix_password = 'zabbix_password'

def main():
    zapi = ZabbixAPI(zabbix_url)
    zapi.login(zabbix_user, zabbix_password)

    hosts = zapi.host.get(output=["hostid", "host", "name"], selectInterfaces=["ip", "dns", "useip"])
    ip_hosts = {}

    for host in hosts:
        interfaces = host.get("interfaces", [])
        print(interfaces)
        for intf in interfaces:
            if intf.get("useip") == "1":
                ip = intf.get("ip")
                if ip:
                    ip_hosts.setdefault(ip, []).append(host["host"])

    duplicates = {ip: hosts for ip, hosts in ip_hosts.items() if len(hosts) > 1}

    rows = []
    for ip, hosts_list in duplicates.items():
        rows.append({"IP": ip, "Hosts": ", ".join(hosts_list)})

    df = pd.DataFrame(rows)
    df.to_excel("hosts_with_duplicate_ips.xlsx", index=False)
    print("The result was saved to hosts_with_duplicate_ips.xlsx")

if __name__ == "__main__":
    main()
