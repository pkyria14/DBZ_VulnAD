# To join a workstation to an Active Directory (AD) domain, follow these steps:

1. Open the System Properties dialog on the workstation by clicking on "System" in the Control Panel, or by right-clicking on the "This PC" icon on the desktop and selecting "Properties".
2. On the "Computer Name" tab, click on the "Change" button.
3. In the "Computer Name/Domain Changes" dialog, enter the name of the AD domain in the "Domain" field, and click on "OK".
4. If prompted, enter the username and password of a user with permission to join computers to the domain, and click "OK".
5. The workstation will now be joined to the AD domain and will need to be restarted. Click "OK" on the "Computer Name/Domain Changes" dialog, then click "Close" on the "System Properties" dialog, and click "Restart Now" to restart the workstation.

After the workstation has restarted, you can log in using the username and password of a domain user. The workstation will now be subject to the group policies configured for the domain, and can be managed using the Active Directory Users and Computers snap-in on the domain controller.