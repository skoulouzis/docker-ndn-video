The following give you a NDN video server

```bash
$ git clone --depth 1 https://github.com/lasse-ufpa/lasseubuntu.git
$ docker build -t lasseubuntu:14.04 lasseubuntu/ubuntu-14.04/

$ git clone --depth 1 https://github.com/skoulouzis/ndn-with-docker.git
$ docker build -t lassendn:latest ndn-with-docker/ubuntu-14.04/

$ git clone --depth 1 https://github.com/skoulouzis/docker-ndn-video.git
$ docker build -t ndnvideo docker-ndn-video/

$ docker run -it --rm --name ndn -p 6363:6363 ndnvideo /bin/bash
$ nfd-start
$ ndn-repo-ng
```

On another terminal run

```bash
$ docker exec -it ndn /bin/bash
$ cd NDNtube
$ ./build/repo_producer
```

And finally

```bash
$ docker exec -it ndn /bin/bash
$ cd NDNtube
$ ./build/producer
```
