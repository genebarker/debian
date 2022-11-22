# Base Debian 11 Server VM Setup

## Instructions

1. Start with a headless Debian install:
    - use defaults
    - note root password
    - note non-admin username & password
    - don't select a desktop
2. Backup the image from Step 1 to save time on future installs.
3. Login as root and retrieve setup script from repo:
```console
root@debian:~# wget https://github.com/genebarker/deb11base/raw/master/setup.sh && chmod 755 setup.sh
```
4. Retrieve your desired `server.config` file to the same
    (or run the setup to retrieve the template config).
5. Update `server.conf` with desired settings.
6. Run `setup.sh` script.

## Inspiration

- I want to spin-up my servers the way I like them faster.
- I'm tired of making the same setup mistakes and having to
  restart installs to get things just right.
- I want the setups of my servers documented so they can be
  repeated by others.
