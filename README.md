![Create docker image](https://github.com/mwinters-stuff/docker-filebrowser/workflows/Create%20docker%20image/badge.svg)
# docker-filebrowser
Create arm64 filebrowser docker image

See https://github.com/filebrowser/filebrowser

Mount config files to /config

Port 8082 is exposed so make sure your .filebrowser.json is like

```json
{
  "port": 8082,
  "baseURL": "",
  "address": "",
  "log": "/logs/filebrowser.log",
  "database": "/config/filebrowser-users.db",
  "root": "/srv"
}
```
