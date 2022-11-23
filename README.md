Base Debian 11 Server VM Setup

Instructions:

1. Start with a headless Debian install:
    - use defaults
    - note root password
    - note non-admin username & password
    - don't select a desktop
2. Backup the image from Step 1 to save time on future installs.
3. Login as root and retrieve the script from repo:
```console
root@debian:~# wget https://github.com/genebarker/deb11base/raw/master/bsdeb && chmod 755 bsdeb
```
4. Retrieve your desired `server.conf` file to the same
    (or run the script to retrieve example config).
5. Update `server.conf` with desired settings.
6. Run `bsdeb` script.

Design goals:

- Spin-up servers fast;
- Configure them the way I like them;
- Eliminate repeated setup mistakes; and
- Document their setups.
