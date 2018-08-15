# Peerflix Server, Streaming torrent client for Node.js with web ui.

[![Docker Build Status](https://img.shields.io/docker/build/onisuly/peerflix-server.svg)](https://github.com/onisuly/docker-peerflix-server) [![Docker Automated build](https://img.shields.io/docker/automated/onisuly/peerflix-server.svg)](https://github.com/onisuly/docker-peerflix-server) [![Docker Stars](https://img.shields.io/docker/stars/onisuly/peerflix-server.svg)](https://github.com/onisuly/docker-peerflix-server) [![Docker Pulls](https://img.shields.io/docker/pulls/onisuly/peerflix-server.svg)](https://github.com/onisuly/docker-peerflix-server)

This Dockerfile build an image for [peerflix-server](https://github.com/asapach/peerflix-server) with password protection capability.

## Quick Start

```shell
docker run -d --name peerflix-server \
-p 8080:8080 \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
onisuly/peerflix-server
```

## Enable Password Protection

```shell
docker run -d --name peerflix-server \
-p 8080:8080 \
-e SECURE=true \
-e USERNAME=your_name \
-e PASSWORD=your_password \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
onisuly/peerflix-server
```

If you want to add multiple users, your can generate .htpasswd file [here](http://www.htaccesstools.com/htpasswd-generator/) and mount it to your container.

```shell
docker run -d --name peerflix-server \
-p 8080:8080 \
-v /your/path/to/.htpasswd:/etc/squid/users \
-v /your/path/to/torrent-stream:/tmp/torrent-stream \
onisuly/peerflix-server
```

---

Read [Peerflix Server Readme](https://github.com/asapach/peerflix-server/blob/master/README.md) for more information.
