docker pull mongo
#=================启动前准备工作================
mkdir -p ~/mongo  ~/mongo/db

#=================docker内启动nginx================
#-p 27017:27017 :将容器的27017 端口映射到主机的27017 端口
#-v $PWD/db:/data/db :将主机中当前目录下的db挂载到容器的/data/db，作为mongo数据存储目录
docker run -p 27017:27017 -v ~/db:/data/db -d mongo
#连接容器
docker run -it mongo mongo --host 129.211.21.250

#进入容器，08c2beed495d为容器id
docker exec -it 08c2beed495d mongo

#=================mongo docker内搭建集群================
#第一步，建立网络bridge
docker network create mongo-network
#第二步，建立docker运行挂载目录
mkdir -p ~/mongo  ~/mongo/master/db ~/mongo/slave/db ~/mongo/arbiter/db
mkdir -p ~/mongo  ~/mongo/master/master.conf ~/mongo/slave/slave.conf ~/mongo/arbiter/arbiter.conf
#第三步，运行容器
docker run -p 28001:27017 --name mongo-master -v ~/mongo/master/db:/data/db -d mongo --replSet mongoreplset --net mongo-network
docker run -p 28002:27017 --name mongo-salve -v ~/mongo/salve/db:/data/db -d mongo --replSet mongoreplset --net mongo-network
docker run -p 28003:27017 --name mongo-arbiter -v ~/mongo/arbiter/db:/data/db -d mongo --replSet mongoreplset --net mongo-network
#然后再运行一个连接到上述三个MongoDB的容器
docker run --rm -it --name mongo-client --net mongo-network mongo /bin/bash
#然后在容器中执行
mongo --host mongo-master
#查看几个容器的IP
docker network inspect mongo-network
#使用IP地址配置
config = {_id:"test-rep", version:1, members:[{_id:0, host:"172.19.0.5:27017", priority:5}, {_id:1, host:"172.19.0.3:27017", priority:2}, {_id:2, host:"172.19.0.4:27017", priority:3}]}
rs.initiate(config);
#检查把mongo-master停掉，mongo-slave会成为primary
#添加用户
db.createUser(
{
user: "admin",
pwd: "admin",
roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
}
);
#启用权限校验
docker run --rm -it --name mongo-master --net=mongo-network mongo --replSet mongoreplset --auth
docker run --rm -it --name mongo-slave --net=mongo-network mongo --replSet mongoreplset --auth
docker run --rm -it --name mongo-arbiter --net=mongo-network mongo --replSet mongoreplset --auth
#Replica Set要使用keyFile的校验方式，让集群的member之间同步，也就是说，通过keyFile获得__system用户在local上的权限
openssl rand -base64 756 > <path-to-keyfile>
chmod 400 <path-to-keyfile>
