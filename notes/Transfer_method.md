To transfer files from one domain-joined machine to another, you can use one of the following methods:

- Use the Windows file sharing feature to share a folder on the source machine, and access the shared folder from the destination machine using the network path (e.g. \\source_machine\shared_folder). 
To do this, follow these steps:

1. On the source machine, right-click on the folder that you want to share, and select "Properties".
2. On the "Sharing" tab, click on the "Advanced Sharing" button.
3. In the "Advanced Sharing" dialog, check the "Share this folder" option, and click "OK".
4. In the folder properties dialog, click on the "Permissions" button.
5. In the "Permissions for SharedFolder" dialog, add the destination machine to the list of users and assign it the appropriate permissions (e.g. "Read" or "Read/Write").
6. On the destination machine, open a File Explorer window and enter the network path to the shared folder (e.g. \\source_machine\shared_folder) in the address bar.

The shared folder will now be accessible