# To install an Active Directory Domain Controller (AD DC) on a Windows machine, follow these steps:

1. Open the Server Manager and click on the "Add roles and features" link.
2. On the "Before you begin" page, click "Next".
3. On the "Select installation type" page, select "Role-based or feature-based installation" and click "Next".
4. On the "Select destination server" page, select the server where you want to install the AD DC and click "Next".
5. On the "Select server roles" page, select the "Active Directory Domain Services" role and click "Next".
6. On the "Select features" page, click "Next" to skip the features selection.
7. On the "Active Directory Domain Services" page, click "Next" to confirm the installation of the required role services.
8. On the "Confirm installation selections" page, review the selected roles and features and click "Install" to begin the installation process.
9. When the installation is complete, click "Promote this server to a domain controller" on the "Post-deployment Configuration" page.
10. On the "Deployment Configuration" page, select "Add a new forest" and enter the name of the root domain for the new AD forest.
11. On the "Domain Controller Options" page, specify the Domain Name System (DNS) server, the functional level of the new forest and domain, and any other options as needed.
12. On the "Additional Options" page, specify the Directory Services Restore Mode (DSRM) password and any other options as needed.
13. Review the summary on the "Prerequisites Check" page, and if all checks pass, click "Install" to begin the AD DC promotion process.
14. When the promotion process is complete, click "Close" to exit the wizard.

After the AD DC has been installed and promoted, you can use the Active Directory Users and Computers snap-in to manage the AD forest and domain, and the Group Policy Management snap-in to manage group policies.