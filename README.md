# Bootstrapping

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone git@github.com:fredoliveira/boxen.git /opt/boxen/repo
cd /opt/boxen/repo
script/boxen
```

## Running without Full Disk Encryption

```
script/boxen --no-fde
```
