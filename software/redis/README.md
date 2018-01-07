##### MASTER
 docker run --name redis-master  -p 16379:6379 -e IP=192.168.56.2 -e PORT=16379 -d hub.slyak.com/redis

##### SLAVE
docker run --name redis-slave -p 26379:6379 -e IP=192.168.56.2 -e PORT=26379 -e MODE=slave -e MASTER_IP=192.168.56.2 -e MASTER_PORT=16379  -d hub.slyak.com/redis

##### SENTINEL
docker run --name redis-sentinel1 -p 36379:6379 -e IP=192.168.56.2 -e PORT=36379 -e MODE=sentinel -e MASTER_IP=192.168.56.2 -e MASTER_PORT=16379  -d hub.slyak.com/redis

docker run --name redis-sentinel2 -p 46379:6379 -e IP=192.168.56.2 -e PORT=46379 -e MODE=sentinel -e MASTER_IP=192.168.56.2 -e MASTER_PORT=16379  -d hub.slyak.com/redis