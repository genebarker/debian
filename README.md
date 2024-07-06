# Bootstrap a New Debian Appliance

## Instructions

1. Start with a headless [Debian][1] install:
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
   (or run the script to retrieve base starter config).
5. Update `server.conf` with desired settings.
6. Run `bsdeb` script.

Note: For VPS's like linode, use caution when disabling root access to
SSH. Make sure you setup a non-admin user to avoid locking yourself out.

## Design goals

- Spin-up appliances fast;
- Configure them the way I like them;
- Eliminate repeated setup mistakes; and
- Document their setups.

## `server.conf` Base Starter Setup

Start here. This is the base configuration that sets up the basics that
every appliance should have:

- Sets desired dotfiles
- Sets public key for non-admin user (from Step 1) for SSH access
- Sets up SSH and locks it down
- Sets up unattended upgrades
- Sets up networking
- Installs VIM and sets as default
- Installs handy remote access tools (tmux, rsync)
- Installs windows integration tools (zip, unzip, dos2unix)
- Installs core dev tools (git, ack, bat)

## `resilio.conf` Resilio Sync Setup

This extends the base configuration above to create a Resilio Sync
appliance. Note that you must SSH tunnel in to 127.0.0.1:8888 to configure
the Resilio service using its web interface. This setup is based on the post
[Install Resilio Sync][9] by LinuxBabe. 

## `lapsj.conf` Linux / Apache / PostgreSQL / Samba / Java App Box Setup

This extends the base configuration above to create an appliance that
provides secure self-signed [TLS][8] access to web, database, and java
application services. It uses Samba for local access to backups.

- Uses `lapsj.env` for private settings
- Sets network interface
- Sets hostname
- Sets groups, users, and folders for app as an add-on package using the
  Linux [Filesystem Hierarchy Standard (FHS)][2]
- Sets up [Samba][3] for local access to backup and restore folders
- Sets up [Jetty][4] for java web app services
- Sets up [Easy-RSA][5] to create local CA to use for self-signed SSL
- Sets up [Apache HTTP Server][6] for HTTP, HTTPS, and HTTPS with verify
  client security
  - `hostname/`         HTTP & HTTPS
  - `hostname/api`      HTTPS with verify client (proxy to Jetty)
  - `hostname/private`  HTTPS with verify client
- Sets up [PostgreSQL][7] db server for HTTPS with verify client security


[1]: https://www.debian.org
[2]: https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard
[3]: https://www.samba.org
[4]: https://eclipse.dev/jetty
[5]: https://github.com/OpenVPN/easy-rsa
[6]: https://httpd.apache.org
[7]: https://www.postgresql.org
[8]: https://en.wikipedia.org/wiki/Transport_Layer_Security
[9]: https://www.linuxbabe.com/ubuntu/install-resilio-sync-btsync-ubuntu
