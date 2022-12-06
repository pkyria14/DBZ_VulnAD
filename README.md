# DBZ AD

![Lay of the Land](https://github.com/pkyria14/active_directory/blob/main/images/DBZ_AD.png?raw=true)
## Motivation

This project was an idea I had when I was studying for my OSCP (2022 version). The active directory part of the exam was new and I wanted a way to get familiar with the ways an attacker should approach attacking the active directory environment. My way of familiarizing myself with active directory was to setup my own lab and experiment with a wide range of attacks on it. I believe this will help future students or people with not a lot of experience with active directory security, to familiarize themselves by experimenting and attacking in their own home lab.

## Installation

The virtual machines will be available for download at my github repository for this project           https://github.com/pkyria14/active_directory. At the same repository everyone will be able to find notes on how to setup the environment and start experimenting in your own home lab. There will also be a code folder, that will explain the different ways you could setup and customize your environment.

## Environment

3 Domains and 7 machines (5 servers and 2 workstations)

There will bea a number of vulnerabilities on each machine and Y ways to exploit them and get access. Once you an attacker gets access to one machine, he will be able to escalate his privileges and pivot through the network and the domains until he compromises the domain admin of every domain. The environment consists of DBZ root domain, EARTH leaf domain and NAMEK leaf domain. As its portraited in Figure 1, there is a trust relationship between all the domains and thus an attacker can exploit that relationship to pivot from domain to domain.

## Sample Demo

An attacker finds an exposed web server in the web from the DBZ company that is trying to hire a fighter. That web server is accepting the candidates resume as a pdf from a file upload. There are some vulnerabilities in the file upload code of php that might let the attacker upload a reverse shell on the web server and get access to the internal systems of the server. Then the attacker will need to find a way to elevate his privileges from *iis apppool\defaultapppool* to ***nt authority/system.*** After the successful privilege escalation the attacker will be able to pivot through the domain and enumerate other machines to find possible targets. 

The ultimate goal for the attacker is to get the credentials/access of the domain admin account. To do that he will need to pivot through a lot of vulnerable machines and get access to different sets of users and groups with different layers of access.

## Foothold
Upload Vulnerability:

- after upload create a confirmation message on the same page - no need to redirect to another page
- php checks :
    - dont let php, html extensions upload
    - only let jpg, jpeg, gif, png, pdf extensions to upload
    - magic header check in php : PNG : "\x89PNG\r\n\x1a\n\0\0\0\rIHDR\0\0\x03H\0\xs0\x03[”
    
    [File Upload](https://book.hacktricks.xyz/pentesting-web/file-upload#magic-header-bytes)
    

File upload main headers :

- bless editor to edit file’s header info

Header reference : [[List of file signatures — Wikipedia]](https://en.wikipedia.org/wiki/List_of_file_signatures)

## Privilege Escalation Part 1
### *From iis apppool\defaultapppool ➡️ nt authority/system*

```
Check my privileges :
> whoami /priv
SeChangeNotifyPrivilege       Bypass traverse checking                  Enabled 
SeImpersonatePrivilege        Impersonate a client after authentication Enabled 
SeCreateGlobalPrivilege       Create global objects                     Enabled
```

Windows Privilege Escalation :

> An elevation of privilege vulnerability exists when the Windows Print Spooler service improperly performs privileged file operations. An attacker who successfully exploited this vulnerability could run arbitrary code with SYSTEM privileges. An attacker could then install programs; view, change, or delete data; or create new accounts with full user rights." By Microsoft.
> 

Exploit technique:

Printspooler → getsystem from msfconsole will automatically run the exploit and give as a shell with administrator privileges.

### System Privileges

Dump hashes - Upload mimikatz to the victim and run:

```powershell
Invoke-Mimikatz -Command '"token::elevate" "lsadump::sam"'
```

## Attack vectors
### Setup different attack vectors by running the scripts on the domain controller of the targetted domain.

List of attack vectors:

- ACLs/ACEs -> abuse weak permissions
- ASREPRoastable user
- Anonymous LDAP
- AD certificates
- GPO abuse
- NTLM Relay
- Resource Based Constrained
- Kerberoastable user
- Pass the ticket
- SID History Injection
- Overpass/Pass the hash
- Constrained delegation -> impersonate a user against a service
- Unconstrained Delegation
- Silver Ticket
- Golden Ticket
- Skeleton Key

This list will be often updated as I work on creating more scripts.