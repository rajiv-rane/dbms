// connect to mongodb
// sudo systemctl status mongod
// sudo systemctl start mongod
// sudo systemctl enable mongod
// mongosh

// 1
// show dbs; or show databases;
// use rajiv;

// 2
db.createCollection('cmrit');
// show tables;
db.getCollectionNames(); //or show tables;

// 3
db.cmrit.insertMany([{name:"Mack",age:20},{name:"Sai",age:21},{name:"Ram",age:25}]);

// 4
db.cmrit.find(); //all the objects in table displayed
// 5
db.cmrit.findOne({name:"Sai"}); //finds one if it exists
db.cmrit.updateOne({name:"rajiv"},{$set:{age:20}});

// 6
db.cmrit.find();
db.cmrit.deleteOne({name:"rane"});

// 7
db.cmrit.find();
db.cmrit.deleteMany({name:{$in:["rane","sunita","sourav"]}});

// 8
db.cmrit.find();
db.cmrit.drop();
db.dropDatabase();