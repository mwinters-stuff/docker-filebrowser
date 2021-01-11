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

Example docker-compose.yaml excerpt
```yaml
  filebrowser:
    image: ghcr.io/mwinters-stuff/docker-filebrowser:latest
    container_name: filebrowser
    restart: always
    environment:
      - "TZ=Pacific/Auckland"
    networks:
      - backend
    volumes:
      - "./conf/filebrowser:/config"
      - "./logs/filebrowser:/logs"
      - nfs-nas-tv:/srv/TV
      - nfs-nas-movies:/srv/Movies
      - nfs-nas-music:/srv/Music
      - nfs-nas-others:/srv/OtherVideos
    healthcheck:
      test: pidof filebrowser || exit 1
      interval: 60s
      timeout: 10s
      retries: 3     
volumes:
  nfs-nas-tv:
    driver: local
    driver_opts:
      type: "nfs"
      o: "addr=nas,nolock,rw,tcp,noatime"
      device: ":/share/TV"
  nfs-nas-movies:
    driver: local
    driver_opts:
      type: "nfs"
      o: "addr=nas,nolock,rw,tcp,noatime"
      device: ":/share/Movies"
  nfs-nas-music:
    driver: local
    driver_opts:
      type: "nfs"
      o: "addr=nas,nolock,rw,tcp,noatime"
      device: ":/share/Music"
  nfs-nas-others:
    driver: local
    driver_opts:
      type: "nfs"
      o: "addr=nas,nolock,rw,tcp,noatime"
      device: ":/share/OtherVideos"
```
