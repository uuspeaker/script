#当你不知道有那些属性可以查看时：
curl 127.0.0.1:9200/_cat/
#查看集群的健康状态
curl http://127.0.0.1:9200/_cat/health?pretty=true
#查看集群的索引数
curl http://127.0.0.1:9200/_cat/indices?v
#查看集群所在磁盘的分配状况
curl http://127.0.0.1:9200/_cat/allocation?v
#查看集群的节点查看集群的节点
curl http://127.0.0.1:9200/_cat/nodes?v
#elasticsearch启动后查看是否启动成功：
curl -XGET "http://localhost:9200/_cluster/health?pretty=true"
#停止elasticsearch应用：
curl -XPOST "http:// localhost:9200/_shutdown"
#检查集群状态：
curl localhost:9200/_cluster/stats?pretty
#节点状态：
curl localhost:9200/_nodes/process?pretty

#过滤查看所有未分配索引的方式，第一列表示索引名，第二列表示分片编号，第三列p是主分片，r是副本
curl -s "http://localhost:9200/_cat/shards" | grep UNASSIGNED
