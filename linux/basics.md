- **for loop**
    
```sh
    for i in {1..10}; do touch test_file_$i.txt; done;
```

- **archive**
    - **c:** create ```tar cf my_archive.tar file_name*```
    - **t:** list   ```tar tf my_archive.tar```
    - **r:** append ```tar rf my_archive.tar file1.txt```
    - **x:** extract ```tar xf my_archive.tar```
    - **f:** read or write from file

- **compression**
    - **z:** create archive with gzip ```tar czf my_archive.tar.gz file_name*```
    - use bzip2: ```tar cjf my_archive.tar.bz2 file_name*```
    - use zip: ```zip -r archive.zip file_name*```
- **pipe**
    - find word and count occurence: ```cat my_file.txt | grep my_word | wc -l```
    - ```cat /etc/passwd | grep massi | cut -d: -f6```
- **wc**
    - count number of lines: ```wc my_file.txt```
- **grep**
    - find words start with M ```grep -E ^M my_test.txt```

- Rerun the last command I used
    - ex: ```!cat```

## Files and Directories

- IO redirection
    - ```>``` : stout
    - ```<``` : sdin
    - ```>>``` : append

## Security

- `/etc/sudoers:` contains all what users can do
- `/etc/password:` users and their infos (9 fields)
- `/etc/shadow:`   hashed password users
- `/etc/group:`  users groups
- `/etc/login.defs` contains login configurations

- Difference between system user and standard user ?
    - Sytem user (Service account) do not have a login shell

## Users and groups

### Users

- Create user `useradd -m username` (-m: make home dire) or `adduser username`
- Modify user ```usermod```
- Assign password to user ```passwd usename```
- ```/etc/skel:``` folder contains all files to be added in user's home when it's created
- UID:
    - 0: root
    - 1-99: system users
    - 100+: standard users
    - 65534: user nobody

### Groups

- Create group ```groupadd groupname``` or ```addgroup groupname```
- Add user to existing group ```usermod -a -G groupname username```
- After a user was added to a group it should logout in to be added to the group

## Network

- ```ip addr show``` or ```ifconfig``` show host ip adress
- ```dig hostname``` or  ```nslookup hostname``` or ```host hostname``` resolve hostname
- ```/etc/resolv.conf``` file used to determine which hosts to use for DNS queries
- ```/etc/hosts``` map ip adress to hostnames

- ```ip route show``` show the route we are traversing
- ```netstat``` view services and active connections

## Useful commands

- ```w``` check how is login
- ```last``` the history of login
