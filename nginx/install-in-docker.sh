docker pull nginx

#=================启动前准备工作================
mkdir -p ~/nginx/ftp ~/nginx/logs ~/nginx/conf  ~/nginx/conf.d
docker cp f8d142e8d3a4:/etc/nginx/nginx.conf ~/nginx/conf
docker cp f8d142e8d3a4:/var/log/nginx/. ~/nginx/logs
docker cp f8d142e8d3a4:/etc/nginx/conf.d/.  ~/nginx/conf.d

#=================docker内启动nginx================
#-p 8082:80： 将容器的 80 端口映射到主机的 8082 端口。
#--name runoob-nginx-test-web：将容器命名为 runoob-nginx-test-web。
#-v ~/nginx/www:/usr/share/nginx/html：将我们自己创建的 www 目录挂载到容器的 /usr/share/nginx/html。
#-v ~/nginx/conf/nginx.conf:/etc/nginx/nginx.conf：将我们自己创建的 nginx.conf 挂载到容器的 /etc/nginx/nginx.conf。
#-v ~/nginx/logs:/var/log/nginx：将我们自己创建的 logs 挂载到容器的 /var/log/nginx
docker run -d -p 8082:80 --name nginx \
-v ~/nginx/ftp:/usr/share/nginx/html \
-v ~/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
-v ~/nginx/logs:/var/log/nginx \
-v ~/nginx/logs:/var/log/nginx \
-v ~/nginx/conf.d:/etc/nginx/conf.d nginx

#进入容器，08c2beed495d为容器id
docker exec -it 08c2beed495d bash
