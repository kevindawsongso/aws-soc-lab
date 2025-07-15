54.90.164.244
nmap -sS -Pn -p 21,42,69,135,445,1433,3306,5060,11211 54.90.164.244
nmap -sS -Pn -p 21,42,69,135,445,1433,3306,5060,11211 54.90.164.244


┌──(kali㉿KDDELL)-[~]
└─$ nmap -sS -Pn -p 21,42,69,135,445,1433,3306,5060,11211 54.90.164.244
Starting Nmap 7.95 ( https://nmap.org ) at 2025-07-13 15:18 EDT
Nmap scan report for ec2-54-90-164-244.compute-1.amazonaws.com (54.90.164.244)
Host is up (0.027s latency).

PORT      STATE    SERVICE
21/tcp    open     ftp
42/tcp    filtered nameserver
69/tcp    filtered tftp
135/tcp   filtered msrpc
445/tcp   open     microsoft-ds
1433/tcp  open     ms-sql-s
3306/tcp  open     mysql
5060/tcp  filtered sip
11211/tcp open     memcache

Nmap done: 1 IP address (1 host up) scanned in 2.49 seconds

┌──(kali㉿KDDELL)-[~]
└─$ sudo nmap -sS -Pn -p 21,23,80,443,445,1433,3306,11211,27017 54.90.164.244
[sudo] password for kali:
Starting Nmap 7.95 ( https://nmap.org ) at 2025-07-13 15:24 EDT
Nmap scan report for ec2-54-90-164-244.compute-1.amazonaws.com (54.90.164.244)
Host is up (0.028s latency).

PORT      STATE SERVICE
21/tcp    open  ftp
23/tcp    open  telnet
80/tcp    open  http
443/tcp   open  https
445/tcp   open  microsoft-ds
1433/tcp  open  ms-sql-s
3306/tcp  open  mysql
11211/tcp open  memcache
27017/tcp open  mongod

Nmap done: 1 IP address (1 host up) scanned in 0.13 seconds

┌──(kali㉿KDDELL)-[~]
└─$ sudo nmap -A -T4 54.90.164.244
Starting Nmap 7.95 ( https://nmap.org ) at 2025-07-13 15:24 EDT
Nmap scan report for ec2-54-90-164-244.compute-1.amazonaws.com (54.90.164.244)
Host is up (0.020s latency).
Not shown: 992 filtered tcp ports (no-response)
Bug in ms-sql-ntlm-info: no string output.
PORT     STATE SERVICE      VERSION
21/tcp   open  ftp          Synology DiskStation NAS ftpd
| ftp-anon: Anonymous FTP login allowed (FTP code 230)
|_Can't get directory listing: TIMEOUT
22/tcp   open  ssh          OpenSSH 6.0p1 Debian 4+deb7u2 (protocol 2.0)
| ssh-hostkey:
|   2048 7f:3d:7c:b4:88:63:0d:e3:aa:a9:0e:b8:af:94:d3:c4 (RSA)
|   256 75:b8:d0:72:3d:5a:60:cc:9a:f2:f7:fe:74:b5:16:55 (ECDSA)
|_  256 a6:fb:24:84:47:f5:d5:fd:af:d2:6d:46:fb:cc:81:03 (ED25519)
23/tcp   open  telnet?
80/tcp   open  http         nginx
|_http-title: Directory listing for /
443/tcp  open  ssl/http     nginx
|_http-title: Directory listing for /
| ssl-cert: Subject: commonName=Nepenthes Development Team/organizationName=dionaea.carnivore.it/countryName=DE
| Not valid before: 2025-07-13T03:10:07
|_Not valid after:  2026-07-13T03:10:07
|_ssl-date: TLS randomness does not represent time
445/tcp  open  microsoft-ds Windows XP microsoft-ds
1433/tcp open  ms-sql-s     Microsoft SQL Server 2000 8.00.528.00; SP1+
| ms-sql-info:
|   54.90.164.244:1433:
|     Version:
|       name: Microsoft SQL Server 2000 SP1+
|       number: 8.00.528.00
|       Product: Microsoft SQL Server 2000
|       Service pack level: SP1
|       Post-SP patches applied: true
|_    TCP port: 1433
3306/tcp open  mysql        MySQL 5.7.16
| mysql-info:
|   Protocol: 10
|   Version: 5.7.16
|   Thread ID: 1729232896
|   Capabilities flags: 41516
|   Some Capabilities: Support41Auth, LongColumnFlag, SupportsTransactions, SupportsCompression, ConnectWithDatabase, Speaks41ProtocolNew
|   Status: Autocommit
|_  Salt: aaaaaaaa
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
OS fingerprint not ideal because: Missing a closed TCP port so results incomplete
No OS matches for host
Network Distance: 7 hops
Service Info: OS: Linux; Device: storage-misc; CPE: cpe:/o:linux:linux_kernel

Host script results:
|_clock-skew: mean: -16h48m00s, deviation: 42m23s, median: -17h17m59s
|_smb2-time: Protocol negotiation failed (SMB2)
| smb-os-discovery:
|   OS: Windows XP (Windows 2000 LAN Manager)
|   OS CPE: cpe:/o:microsoft:windows_xp::-
|   NetBIOS computer name: HOMEUSER-3AF6FE\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2025-07-13T04:10:06+01:00
| smb-security-mode:
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)

TRACEROUTE (using port 80/tcp)
HOP RTT     ADDRESS
1   0.31 ms 172.23.128.1
2   4.30 ms 192.168.10.1
3   9.10 ms 100.65.208.1
4   7.31 ms 10.55.21.30
5   6.20 ms 10.55.39.11
6   ...
7   4.53 ms ec2-54-90-164-244.compute-1.amazonaws.com (54.90.164.244)

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 336.34 seconds

┌──(kali㉿KDDELL)-[~]
└─$