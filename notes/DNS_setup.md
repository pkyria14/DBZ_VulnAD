# To set up the Active Directory Domain Name System (DNS) on a domain controller, follow these steps:

1. Open the Server Manager on the domain controller and click on the "Tools" menu.
2. In the "Tools" menu, select "DNS" to open the DNS Manager.
3. In the DNS Manager, expand the "Forward Lookup Zones" folder, right-click on the folder, and select "New Zone" to create a new DNS zone.
4. In the "New Zone Wizard", select "Primary Zone" and click "Next".
5. On the "Zone Name" page, enter the name of the AD domain, and click "Next".
6. On the "Dynamic Update" page, select "Allow only secure dynamic updates" and click "Next".
7. On the "Zone File" page, accept the default zone file name and click "Next".
8. On the "Start of Authority (SOA) Record" page, enter the domain name and the IP address of the domain controller in the "Primary server" and "Host master" fields, respectively, and click "Next".
9. Review the summary on the "Finish" page, and click "Finish" to create the new DNS zone.
10. The new DNS zone will now be listed under the "Forward Lookup Zones" folder in the DNS Manager.
11. In the DNS Manager, right-click on the new DNS zone, and select "New Host" to create a new DNS record.
12. In the "New Host" dialog, enter the hostname and IP address of the domain controller, and click "Add Host" to add the DNS record.
13. Repeat the previous step for each domain-joined host that you want to add to the DNS zone.
14. The DNS zone is now set up and configured to resolve hostnames to IP addresses for the domain.

Note: The DNS service must be running on the domain controller in order for the DNS records to be accessible. You can use the Services snap-in to start or stop the DNS service on the domain controller.