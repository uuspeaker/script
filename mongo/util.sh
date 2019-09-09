#添加用户
db.createUser({
  user: "admin",
  pwd: "admin",
  roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
});

#将某张表的数据插入到另一张表
db.KnowledgeTree.find().forEach(function(d){ db.getSiblingDB('vue_study')['KnowledgeTree'].insert(d); });
#修改答案,用于测试
db.XkwSubject.update({'key':'ba15d7af1561b871e77bee0ebb24d814'},{$set:{ 'questionContent':['.所以就很难定义什么是“人工”制造的“智能”了。因此人工智能的研究往往涉及对人的', '智能本身的研究。其它关于动物或其它人造系统的智能也普遍被认为是人工智能相关的研','究课题',], 'answer': 0, 'questionType': 2}})
db.XkwSubject.update({'key':'ba15d7af1561b871e77bee0ebb24d814'},{$set:{ 'questionContent':'所以就很难定义什么是“人工”制造的“智能”了。因此人工智能的研究往往涉及对人的, 智能本身的研究。其它关于动物或其它人造系统的智能也普遍被认为是人工智能相关的研,究课题', 'answer': 0}})
