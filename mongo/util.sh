#添加用户
db.createUser({
  user: "admin",
  pwd: "admin",
  roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
});

#将某张表的数据插入到另一张表
db.KnowledgeTree.find().forEach(function(d){ db.getSiblingDB('vue_study')['KnowledgeTree'].insert(d); });
