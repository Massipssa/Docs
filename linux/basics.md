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
    - find word and count occurence: ```cat my_file.txt | grep my_word | wc -l ```
    - ```cat /etc/passwd | grep massi | cut -d: -f6```
- **wc**
    - count number of lines: ```wc my_file.txt```
- **grep**
    - find words start with M ```grep -E ^M my_test.txt```

- Rerun the last command I used
    - ex: ```!cat```

## Security

- ```/etc/sudoers:``` contains all what users can do
- ```/etc/password:``` users and their infos (9 fields)
- ```/etc/shadow:```   hashed password users
- ```/etc/group:```  users groups

- Difference between system user and standard user ?
    - Sytem user do not have a login shell
