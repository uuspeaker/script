#建立挂载目录
mkdir -p ~/mysql/data ~/mysql/logs ~/mysql/conf
#启动mysql镜像
docker run -p 3306:3306 --name mysql -v ~/mysql/conf:/etc/mysql/conf.d -v ~/mysql/logs:/logs -v ~/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
