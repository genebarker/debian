# Bootstrap a New Debian Server

## Instructions

1. Start with a headless Debian install:
    - use defaults
    - note root password
    - note non-admin username & password
    - don't select a desktop
2. Backup the image from Step 1 to save time on future installs.
3. Login as root and retrieve the script from repo:
```console
root@debian:~# wget -N https://github.com/genebarker/debian/raw/master/bsdeb && chmod 755 bsdeb
```
4. Retrieve your desired `server.conf` file to the same
   (or run the script to retrieve a bare-bones example config).
5. Update `server.conf` with desired settings.
6. Run `bsdeb` script.

## Design goals

- Spin-up servers fast;
- Configure them the way I like them;
- Eliminate repeated setup mistakes; and
- Document their setups.

## `server.conf` Minimal / Starter Setup

- Sets desired dotfiles
- Sets SSH port
- Sets user and public key for SSH access

## `lapsj.conf` Linux / Apache / PostgreSQL / Samba / Java App Box Setup

Extends the minimal configuration above to create environment for an app
that provides secure self-signed access to web, database, and java
application services. It uses Samba for local access to backups.

- Uses `lapsj.env` for private settings
- Sets network interface
- Sets hostname
- Sets groups, users, and folders for app as an add-on package using the
  Linux Filesystem Hierarchy Standard (FHS)
- Sets up Samba for local access to backup and restore folders
- Sets up Easy-RSA to create local CA to use for self-signed SSL
- Sets up Apache2 web server for HTTP, HTTPS, and HTTPS with verify client
  - `hostname/`         HTTP & HTTPS
  - `hostname/private`  HTTPS with verify client
- Sets up PostgreSQL db server for HTTPS with verify client security
