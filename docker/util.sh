######################################docker安装########################################################
#移除旧的版本：
$ sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
#安装一些必要的系统工具：
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
#添加软件源信息：
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#更新 yum 缓存：
sudo yum makecache fast
#安装 Docker-ce：
sudo yum -y install docker-ce
#启动 Docker 后台服务
sudo systemctl start docker
#测试运行 hello-world
[root@runoob ~]# docker run hello-world

#请在该配置文件中加入（没有该文件的话，请先建一个）：
 /etc/docker/daemon.json
#配置镜像
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}

#执行以下命令来删除 Docker CE：
$ sudo yum remove docker-ce
$ sudo rm -rf /var/lib/docker

######################################docker启动与停止########################################################
启动        systemctl start docker
守护进程重启   sudo systemctl daemon-reload
重启docker服务   systemctl restart  docker
重启docker服务  sudo service docker restart
关闭docker service docker stop
关闭docker systemctl stop docker
